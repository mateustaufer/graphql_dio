import 'package:get/get.dart';
import '../../../data/providers/planets_provider.dart';
import '../../../data/providers/users_provider.dart';
import '../../../data/repositories/planets_repository.dart';
import '../../../data/repositories/users_repository.dart';
import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<HomeController>(
      HomeController(
        usersRepository: UsersRepository(UsersProvider()),
        planetsRepository: PlanetsRepository(PlanetsProvider()),
      ),
    );
  }
}
