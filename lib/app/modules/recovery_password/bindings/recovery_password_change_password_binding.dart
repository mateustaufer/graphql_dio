import 'package:get/get.dart';

import '../controllers/recovery_password_change_password_controller.dart';
import '../../../data/providers/users_provider.dart';
import '../../../data/repositories/users_repository.dart';

class RecoveryPasswordChangePasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<RecoveryPasswordChangePasswordController>(
      RecoveryPasswordChangePasswordController(
          repository: UsersRepository(UsersProvider())),
    );
  }
}
