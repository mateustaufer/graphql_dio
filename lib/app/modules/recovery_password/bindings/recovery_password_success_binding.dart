import 'package:get/get.dart';

import '../../../data/providers/users_provider.dart';
import '../../../data/repositories/users_repository.dart';
import '../controllers/recovery_password_success_controller.dart';

class RecoveryPasswordSuccessBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<RecoveryPasswordSuccessController>(
      RecoveryPasswordSuccessController(
          repository: UsersRepository(UsersProvider())),
    );
  }
}
