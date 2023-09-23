part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const home = _Paths.home;
  static const login = _Paths.login;
  static const recoveryPasswordEmail = _Paths.recoveryPasswordEmail;
  static const recoveryPasswordBirthOfDate = _Paths.recoveryPasswordBirthOfDate;
  static const recoveryPasswordChangePassword =
      _Paths.recoveryPasswordChangePassword;
  static const recoveryPasswordSuccess = _Paths.recoveryPasswordSuccess;
}

abstract class _Paths {
  _Paths._();
  static const home = '/';
  static const login = '/login';
  static const recoveryPasswordEmail = '/recovery-password/email';
  static const recoveryPasswordBirthOfDate = '/recovery-password/birth';
  static const recoveryPasswordChangePassword =
      '/recovery-password/change-password';
  static const recoveryPasswordSuccess = '/recovery-password/success';
}
