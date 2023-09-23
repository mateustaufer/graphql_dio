import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../widgets/snackbar.dart';
import '../../../data/local_storage/local_storage.dart';
import '../../../data/repositories/users_repository.dart';
import '../../../routes/app_pages.dart';

class LoginController extends GetxController {
  final UsersRepository repository;

  LoginController({required this.repository}) {
    Get.delete<LoginController>();
  }

  final formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final emailHasError = false.obs;
  final emailErrorHeight = 0.0.obs;
  String? validateEmail(String? value) {
    String? message;
    if (emailController.text.replaceAll(' ', '').isEmpty) {
      message = 'Por favor, informe o e-mail.';
    } else if (emailController.text.replaceAll(' ', '').isNotEmpty &&
        !GetUtils.isEmail(emailController.text)) {
      message = 'O e-mail informado não é válido.';
    } else {
      message = null;
    }

    if (message != null) {
      emailHasError.value = true;
      emailErrorHeight.value = 21.5;
    } else {
      emailHasError.value = false;
      emailErrorHeight.value = 0.0;
    }

    return message;
  }

  final passwordController = TextEditingController();
  final passwordFocus = FocusNode();
  final passwordObscureText = true.obs;
  final passwordHasFocus = false.obs;
  final passwordHasError = false.obs;
  final passwordIsEmpty = true.obs;
  final passwordErrorHeight = 0.0.obs;
  String? validatePassword(String? value) {
    String? message;
    if (passwordController.text.replaceAll(' ', '').isEmpty) {
      message = 'Por favor, informe a senha.';
    } else if (passwordController.text.length < 4) {
      message = 'A senha deve ter no mínimo 4 caracteres.';
    } else {
      message = null;
    }

    if (message != null) {
      passwordHasError.value = true;
      passwordErrorHeight.value = 21.5;
    } else {
      passwordHasError.value = false;
      passwordErrorHeight.value = 0.0;
    }

    return message;
  }

  void togglePasswordVisibility() {
    passwordObscureText.value = !passwordObscureText.value;
    passwordFocus.requestFocus();
  }

  final isLoading = false.obs;
  final showHelpMeChat = false.obs;

  @override
  void onInit() {
    super.onInit();

    passwordFocus.addListener(
      () => passwordHasFocus.value = passwordFocus.hasFocus,
    );
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    passwordFocus.dispose();

    super.onClose();
  }

  void login() async {
    isLoading.value = true;

    final isFormValid = formKey.currentState?.validate() ?? false;
    if (!isFormValid) {
      isLoading.value = false;
      return;
    }

    final response = await repository.login(
      email: emailController.text,
      password: passwordController.text,
    );

    response.fold(
      (l) {
        isLoading.value = false;

        AppSnackBar.fail(l.error.toString());

        if (kDebugMode) {
          print(
            'LoginController login stacktrace ==> ${l.stackTrace.toString()}',
          );
        }
      },
      (r) async {
        await LocalStorage.setData(key: 'userToken', value: r.token);

        isLoading.value = false;
        Get.offNamed(Routes.home);
      },
    );
  }
}
