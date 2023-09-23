import 'package:get/get.dart';
import '../../../data/repositories/planets_repository.dart';
import '../../../data/local_storage/local_storage.dart';
import '../../../data/repositories/users_repository.dart';
import '../../../routes/app_pages.dart';

class HomeController extends GetxController {
  final UsersRepository usersRepository;
  final PlanetsRepository planetsRepository;

  HomeController({
    required this.usersRepository,
    required this.planetsRepository,
  }) {
    Get.delete<HomeController>();
  }

  @override
  void onInit() {
    super.onInit();

    checkToken();
  }

  void checkToken() async {
    final token = await LocalStorage.getData(key: 'userToken');
    if (token.toString().replaceAll(' ', '').replaceAll('null', '').isEmpty) {
      Get.toNamed(Routes.login);
    }
  }
}
