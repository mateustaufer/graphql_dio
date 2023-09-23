import 'package:get/get.dart';
import '../../../data/providers/users_provider.dart';
import '../../../data/repositories/users_repository.dart';
import '../controllers/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<LoginController>(
      LoginController(repository: UsersRepository(UsersProvider())),
    );
  }
}
