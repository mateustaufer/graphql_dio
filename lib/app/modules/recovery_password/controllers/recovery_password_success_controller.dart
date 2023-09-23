import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../../data/local_storage/local_storage.dart';
import '../../../data/repositories/users_repository.dart';
import '../../../routes/app_pages.dart';
import '../../../widgets/snackbar.dart';

class RecoveryPasswordSuccessController extends GetxController {
  final UsersRepository repository;

  RecoveryPasswordSuccessController({required this.repository}) {
    Get.delete<RecoveryPasswordSuccessController>();
  }

  final isLoading = false.obs;

  void login() async {
    isLoading.value = true;

    final email =
        kIsWeb ? Get.parameters['email'] ?? '' : Get.arguments as String;

    final password = LocalStorage.getData(key: 'userPassword') ?? '';

    final response = await repository.login(email: email, password: password);

    response.fold(
      (l) {
        AppSnackBar.fail(l.error.toString());
        LocalStorage.removeData(key: 'userPassword');

        isLoading.value = false;
        if (kDebugMode) {
          print(
            'RecoveryPasswordSuccessController login stacktrace ==> ${l.stackTrace.toString()}',
          );
        }
      },
      (r) async {
        await Future.wait(
          [
            LocalStorage.setData(key: 'userToken', value: r.token),
            LocalStorage.removeData(key: 'userPassword'),
          ],
        );

        isLoading.value = false;
        Get.offNamed(Routes.home);
      },
    );
  }
}
