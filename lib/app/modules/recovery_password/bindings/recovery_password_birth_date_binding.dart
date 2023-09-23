import 'package:get/get.dart';

import '../../../data/providers/users_provider.dart';
import '../../../data/repositories/users_repository.dart';
import '../controllers/recovery_password_birth_date_controller.dart';

class RecoveryPasswordBirthOfDateBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<RecoveryPasswordBirthDateController>(
      RecoveryPasswordBirthDateController(
          repository: UsersRepository(UsersProvider())),
    );
  }
}
