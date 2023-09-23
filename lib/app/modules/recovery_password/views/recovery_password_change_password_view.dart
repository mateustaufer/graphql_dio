import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../themes/borders.dart';
import '../../../themes/paths.dart';
import '../../../utils/responsive.dart';
import '../../../widgets/suffix_icon.dart';
import '../components/go_back_button.dart';
import '../components/header.dart';
import '../components/tips_goods_passwords.dart';
import '../controllers/recovery_password_change_password_controller.dart';

class RecoveryPasswordChangePasswordView
    extends GetView<RecoveryPasswordChangePasswordController> {
  const RecoveryPasswordChangePasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            const HeaderRecoveryPassword(imagePath: AppPaths.genius),
            Align(
              alignment: Alignment.topCenter,
              child: SizedBox(
                width: isMobile ||
                        MediaQuery.sizeOf(context).width <
                            Responsive.figmaDesktopScreenWidth
                    ? MediaQuery.sizeOf(context).width
                    : Responsive.figmaDesktopScreenWidth,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  margin: EdgeInsets.only(
                    top: 150,
                    left: isMobile ? 20 : 46,
                    right: isMobile ? 20 : 46,
                  ),
                  padding: EdgeInsets.symmetric(
                    vertical: isMobile ? 40 : 30,
                    horizontal: isMobile ? 20 : 30,
                  ),
                  child: Column(
                    children: [
                      SvgPicture.asset(
                        AppPaths.iconLogo,
                        fit: BoxFit.contain,
                        width: 42,
                        height: 42,
                      ),
                      const SizedBox(height: 30),
                      Text(
                        'Escolha a sua nova senha',
                        style: context.textTheme.headlineLarge,
                      ),
                      const SizedBox(height: 20),
                      Form(
                        key: controller.formKey,
                        child: SizedBox(
                          width: 370,
                          child: Column(
                            children: [
                              Obx(
                                () => TextFormField(
                                  enabled: !controller.isLoading.value,
                                  controller: controller.passwordController,
                                  onChanged: (value) => controller
                                      .passwordIsEmpty.value = value.isEmpty,
                                  validator: controller.validatePassword,
                                  focusNode: controller.passwordFocus,
                                  obscureText:
                                      controller.passwordObscureText.value,
                                  keyboardType: TextInputType.visiblePassword,
                                  style: context.textTheme.labelLarge,
                                  decoration: InputDecoration(
                                    hintText: 'Digite sua nova senha',
                                    border: AppBorders.input.borderOutline,
                                    suffixIcon: Padding(
                                      padding: const EdgeInsets.only(right: 8),
                                      child: Obx(
                                        () => AppSuffixIcon(
                                          onTap: controller
                                                      .passwordHasError.value &&
                                                  controller
                                                      .passwordIsEmpty.value
                                              ? null
                                              : controller
                                                  .togglePasswordVisibility,
                                          hasError: controller
                                                  .passwordHasError.value &&
                                              controller.passwordIsEmpty.value,
                                          hasFocus:
                                              controller.passwordHasFocus.value,
                                          isPassword: true,
                                          isObscureText: controller
                                              .passwordObscureText.value,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 12),
                              Obx(
                                () => TextFormField(
                                  enabled: !controller.isLoading.value,
                                  controller:
                                      controller.passwordConfirmController,
                                  onChanged: (value) => controller
                                      .passwordConfirmIsEmpty
                                      .value = value.isEmpty,
                                  validator: controller.validatePasswordConfirm,
                                  focusNode: controller.passwordConfirmFocus,
                                  obscureText: controller
                                      .passwordConfirmObscureText.value,
                                  keyboardType: TextInputType.visiblePassword,
                                  style: context.textTheme.labelLarge,
                                  decoration: InputDecoration(
                                    hintText: 'Confirme sua nova senha',
                                    border: AppBorders.input.borderOutline,
                                    suffixIcon: Padding(
                                      padding: const EdgeInsets.only(right: 8),
                                      child: Obx(
                                        () => AppSuffixIcon(
                                          onTap: controller
                                                      .passwordConfirmHasError
                                                      .value &&
                                                  controller
                                                      .passwordConfirmIsEmpty
                                                      .value
                                              ? null
                                              : controller
                                                  .togglePasswordConfirmVisibility,
                                          hasError: controller
                                                  .passwordConfirmHasError
                                                  .value &&
                                              controller
                                                  .passwordConfirmIsEmpty.value,
                                          hasFocus: controller
                                              .passwordConfirmHasFocus.value,
                                          isPassword: true,
                                          isObscureText: controller
                                              .passwordConfirmObscureText.value,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 16),
                              const TipsGoodsPasswords(),
                              const SizedBox(height: 20),
                              Obx(
                                () => ElevatedButton(
                                  onPressed: controller.isLoading.value
                                      ? null
                                      : controller.setNewPassword,
                                  child: controller.isLoading.value
                                      ? const SizedBox(
                                          width: 25,
                                          height: 25,
                                          child: CircularProgressIndicator(
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                              Colors.white,
                                            ),
                                            strokeWidth: 3,
                                          ),
                                        )
                                      : Text(
                                          'CONTINUAR',
                                          style: context.textTheme.bodyMedium
                                              ?.copyWith(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 36),
                      const GoBackButton(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
