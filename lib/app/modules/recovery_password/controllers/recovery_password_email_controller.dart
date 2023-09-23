import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/repositories/users_repository.dart';
import '../../../routes/app_pages.dart';
import '../../../widgets/snackbar.dart';

class RecoveryPasswordEmailController extends GetxController {
  final UsersRepository repository;

  RecoveryPasswordEmailController({required this.repository}) {
    Get.delete<RecoveryPasswordEmailController>();
  }

  final formKey = GlobalKey<FormState>();

  final isLoading = false.obs;

  final emailController = TextEditingController(
    text: kIsWeb ? Get.parameters['email'] ?? '' : Get.arguments as String,
  );
  final emailHasError = false.obs;
  String? validateEmail(String? value) {
    emailHasError.value = true;
    if (emailController.text.replaceAll(' ', '').isEmpty) {
      return 'Por favor, informe o e-mail.';
    } else if (emailController.text.replaceAll(' ', '').isNotEmpty &&
        !GetUtils.isEmail(emailController.text)) {
      emailHasError.value = true;
      return 'O e-mail informado não é válido.';
    } else {
      emailHasError.value = false;
      return null;
    }
  }

  @override
  void onClose() {
    emailController.dispose();

    super.onClose();
  }

  void isEmailAlreadyInUse() async {
    isLoading.value = true;

    final isFormValid = formKey.currentState?.validate() ?? false;
    if (!isFormValid) {
      isLoading.value = false;
      return;
    }

    final response = await repository.isEmailAlreadyInUse(
      email: emailController.text.replaceAll(' ', ''),
    );

    response.fold(
      (l) {
        isLoading.value = false;

        AppSnackBar.fail(l.error.toString());

        if (kDebugMode) {
          print(
            'RecoveryPasswordEmailController isEmailAlreadyInUse stacktrace ==> ${l.stackTrace.toString()}',
          );
        }
      },
      (r) {
        isLoading.value = false;

        Get.toNamed(
          Routes.recoveryPasswordBirthOfDate,
          arguments: emailController.text.replaceAll(' ', ''),
          parameters: {'email': emailController.text.replaceAll(' ', '')},
        );
      },
    );
  }
}
