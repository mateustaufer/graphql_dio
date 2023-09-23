import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../utils/is_valid_date.dart';
import '../../../data/repositories/users_repository.dart';
import '../../../routes/app_pages.dart';
import '../../../widgets/snackbar.dart';

class RecoveryPasswordBirthDateController extends GetxController {
  final UsersRepository repository;

  RecoveryPasswordBirthDateController({required this.repository}) {
    Get.delete<RecoveryPasswordBirthDateController>();
  }

  final formKey = GlobalKey<FormState>();

  final birthDateController = TextEditingController();
  final birthDateHasError = false.obs;
  String? validateBirthOfDate(String? value) {
    final birthDate = birthDateController.text.replaceAll(' ', '');

    if (birthDate.isEmpty) {
      birthDateHasError.value = true;
      return 'Por favor, informe a data de nascimento';
    } else if (!DateValidator.isValidDate(birthDate)) {
      birthDateHasError.value = true;
      return 'Informe uma data válida no formato DD/MM/AAAA';
    }

    birthDateHasError.value = false;
    return null;
  }

  final isLoading = false.obs;

  @override
  void onClose() {
    birthDateController.dispose();

    super.onClose();
  }

  void getUserIdByEmailAndBirthdayDate() async {
    isLoading.value = true;

    final isFormValid = formKey.currentState?.validate() ?? false;
    if (!isFormValid) {
      isLoading.value = false;
      return;
    }

    final date = DateFormat('dd/MM/yyyy').parse(
      birthDateController.text.replaceAll(' ', ''),
    );

    final birthDate =
        'day: ${date.day}, month: ${date.month}, year: ${date.year}';

    final email =
        kIsWeb ? Get.parameters['email'] ?? '' : Get.arguments as String;

    final userId = await repository.getUserIdByEmailAndBirthdayDate(
      email: email,
      birthDate: birthDate,
    );

    userId.fold(
      (l) {
        isLoading.value = false;

        AppSnackBar.fail(l.error.toString());

        if (kDebugMode) {
          print(
            'RecoveryPasswordBirthDateController getUserIdByEmailAndBirthdayDate stacktrace ==> ${l.stackTrace.toString()}',
          );
        }
      },
      (r) {
        isLoading.value = false;

        Get.toNamed(
          Routes.recoveryPasswordChangePassword,
          arguments: {'email': email, 'birthDate': birthDate},
          parameters: {'email': email, 'birthDate': birthDate},
        );
      },
    );
  }
}
