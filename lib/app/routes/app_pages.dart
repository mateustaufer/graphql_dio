import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/recovery_password/bindings/recovery_password_birth_date_binding.dart';
import '../modules/recovery_password/bindings/recovery_password_change_password_binding.dart';
import '../modules/recovery_password/bindings/recovery_password_email.dart';
import '../modules/recovery_password/bindings/recovery_password_success_binding.dart';
import '../modules/recovery_password/views/recovery_password_birth_date_view.dart';
import '../modules/recovery_password/views/recovery_password_change_password_view.dart';
import '../modules/recovery_password/views/recovery_password_email_view.dart';
import '../modules/recovery_password/views/recovery_password_success_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static final routes = [
    GetPage(
      name: _Paths.home,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.login,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.recoveryPasswordEmail,
      page: () => const RecoveryPasswordEmailView(),
      binding: RecoveryPasswordEmailBinding(),
    ),
    GetPage(
      name: _Paths.recoveryPasswordBirthOfDate,
      page: () => const RecoveryPasswordBirthOfDateView(),
      binding: RecoveryPasswordBirthOfDateBinding(),
    ),
    GetPage(
      name: _Paths.recoveryPasswordChangePassword,
      page: () => const RecoveryPasswordChangePasswordView(),
      binding: RecoveryPasswordChangePasswordBinding(),
    ),
    GetPage(
      name: _Paths.recoveryPasswordSuccess,
      page: () => const RecoveryPasswordSuccessView(),
      binding: RecoveryPasswordSuccessBinding(),
    ),
  ];
}
