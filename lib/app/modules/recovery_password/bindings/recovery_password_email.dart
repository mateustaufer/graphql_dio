import 'package:get/get.dart';

import '../../../data/providers/users_provider.dart';
import '../../../data/repositories/users_repository.dart';
import '../controllers/recovery_password_email_controller.dart';

class RecoveryPasswordEmailBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<RecoveryPasswordEmailController>(
      RecoveryPasswordEmailController(
          repository: UsersRepository(UsersProvider())),
    );
  }
}
