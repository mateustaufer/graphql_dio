import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bcrypt/bcrypt.dart';

import '../../../data/local_storage/local_storage.dart';
import '../../../data/repositories/users_repository.dart';
import '../../../routes/app_pages.dart';
import '../../../widgets/snackbar.dart';

class RecoveryPasswordChangePasswordController extends GetxController {
  final UsersRepository repository;

  RecoveryPasswordChangePasswordController({required this.repository}) {
    Get.delete<RecoveryPasswordChangePasswordController>();
  }

  final formKey = GlobalKey<FormState>();

  final passwordController = TextEditingController();
  final passwordFocus = FocusNode();
  final passwordObscureText = true.obs;
  final passwordHasFocus = false.obs;
  final passwordHasError = false.obs;
  final passwordIsEmpty = true.obs;
  String? validatePassword(String? value) {
    if (passwordController.text.replaceAll(' ', '').isEmpty) {
      passwordHasError.value = true;
      return 'Por favor, informe a senha.';
    } else if (passwordController.text.length < 4) {
      passwordHasError.value = true;
      return 'A senha deve ter no mínimo 4 caracteres.';
    } else {
      passwordHasError.value = false;
      return null;
    }
  }

  void togglePasswordVisibility() {
    passwordObscureText.value = !passwordObscureText.value;
    passwordFocus.requestFocus();
  }

  final passwordConfirmController = TextEditingController();
  final passwordConfirmFocus = FocusNode();
  final passwordConfirmObscureText = true.obs;
  final passwordConfirmHasFocus = false.obs;
  final passwordConfirmHasError = false.obs;
  final passwordConfirmIsEmpty = true.obs;
  String? validatePasswordConfirm(String? value) {
    if (passwordConfirmController.text != passwordController.text) {
      passwordConfirmHasError.value = true;
      return 'Esta senha não confere com a anterior.';
    } else {
      passwordConfirmHasError.value = false;
      return null;
    }
  }

  void togglePasswordConfirmVisibility() {
    passwordConfirmObscureText.value = !passwordConfirmObscureText.value;
    passwordConfirmFocus.requestFocus();
  }

  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();

    passwordFocus.addListener(
      () => passwordHasFocus.value = passwordFocus.hasFocus,
    );

    passwordConfirmFocus.addListener(
      () => passwordConfirmHasFocus.value = passwordConfirmFocus.hasFocus,
    );
  }

  @override
  void onClose() {
    passwordController.dispose();
    passwordFocus.dispose();
    passwordConfirmController.dispose();
    passwordConfirmFocus.dispose();

    super.onClose();
  }

  void setNewPassword() async {
    isLoading.value = true;

    final isFormValid = formKey.currentState?.validate() ?? false;
    if (!isFormValid) {
      isLoading.value = false;
      return;
    }

    final arguments = Get.arguments as Map<String, String>;

    final email =
        kIsWeb ? Get.parameters['email'] ?? '' : arguments['email'] ?? '';

    final birthDate = kIsWeb
        ? Get.parameters['birthDate'] ?? ''
        : arguments['birthDate'] ?? '';

    final hashPassword = BCrypt.hashpw(
      passwordController.text,
      BCrypt.gensalt(),
    );

    final response = await repository.setNewPassword(
      password: hashPassword,
      birthDate: birthDate,
      email: email,
    );

    response.fold(
      (l) {
        isLoading.value = false;

        AppSnackBar.fail(l.error.toString());

        if (kDebugMode) {
          print(
            'RecoveryPasswordChangePasswordController setNewPassword stacktrace ==> ${l.stackTrace.toString()}',
          );
        }
      },
      (r) async {
        await LocalStorage.setData(
          key: 'userPassword',
          value: passwordController.text,
        );

        isLoading.value = false;

        Get.toNamed(
          Routes.recoveryPasswordSuccess,
          arguments: email,
          parameters: {'email': email},
        );
      },
    );
  }
}
