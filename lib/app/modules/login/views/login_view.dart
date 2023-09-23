import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../routes/app_pages.dart';
import '../../../widgets/suffix_icon.dart';
import '../../../themes/borders.dart';
import '../../../themes/colors.dart';
import '../../../themes/paths.dart';
import '../../../utils/responsive.dart';
import '../controllers/login_controller.dart';
import 'componentes/helpe_me_chat.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Center(
              child: Obx(
                () {
                  double backgroundHeight = (isMobile ? 572 : 491) +
                      controller.emailErrorHeight.value +
                      controller.passwordErrorHeight.value;

                  if (MediaQuery.sizeOf(context).height > backgroundHeight) {
                    backgroundHeight = MediaQuery.sizeOf(context).height;
                  }

                  return SizedBox(
                    width: isMobile ||
                            Responsive.figmaDesktopScreenWidth >
                                MediaQuery.sizeOf(context).width
                        ? MediaQuery.sizeOf(context).width
                        : Responsive.figmaDesktopScreenWidth,
                    height: backgroundHeight,
                    child: SvgPicture.asset(
                      AppPaths.desktopBackgroundLogin,
                      fit: BoxFit.cover,
                    ),
                  );
                },
              ),
            ),
            Center(
              child: Obx(
                () {
                  double marginTop = ((MediaQuery.sizeOf(context).height / 2) -
                          (((isMobile ? 572 : 491) +
                                  controller.emailErrorHeight.value +
                                  controller.passwordErrorHeight.value) /
                              2)) +
                      2.5;

                  if (marginTop < 0) {
                    marginTop = 0;
                  }

                  return SizedBox(
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
                        top: marginTop,
                        left: isMobile ? 20 : 46,
                        right: isMobile ? 20 : 46,
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: isMobile ? 40 : 30,
                        horizontal: isMobile ? 20 : 30,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset(
                            AppPaths.iconLogo,
                            fit: BoxFit.contain,
                            width: 42,
                            height: 42,
                          ),
                          SizedBox(height: isMobile ? 36 : 30),
                          Text(
                            'Seja bem-vindo Explorador!',
                            style: context.textTheme.headlineLarge,
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: isMobile ? 24 : 20),
                          Form(
                            key: controller.formKey,
                            child: SizedBox(
                              width: 370,
                              child: Column(
                                children: [
                                  TextFormField(
                                    enabled: !controller.isLoading.value,
                                    controller: controller.emailController,
                                    validator: controller.validateEmail,
                                    style: context.textTheme.labelLarge,
                                    keyboardType: TextInputType.emailAddress,
                                    decoration: InputDecoration(
                                      hintText: 'E-mail',
                                      suffixIcon: Padding(
                                        padding:
                                            const EdgeInsets.only(right: 8),
                                        child: Obx(
                                          () => AppSuffixIcon(
                                            hasError:
                                                controller.emailHasError.value,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 12),
                                  Obx(
                                    () => TextFormField(
                                      enabled: !controller.isLoading.value,
                                      controller: controller.passwordController,
                                      onChanged: (value) => controller
                                          .passwordIsEmpty
                                          .value = value.isEmpty,
                                      validator: controller.validatePassword,
                                      focusNode: controller.passwordFocus,
                                      obscureText:
                                          controller.passwordObscureText.value,
                                      keyboardType:
                                          TextInputType.visiblePassword,
                                      style: context.textTheme.labelLarge,
                                      decoration: InputDecoration(
                                        hintText: 'Digite sua senha',
                                        border: AppBorders.input.borderOutline,
                                        suffixIcon: Padding(
                                          padding:
                                              const EdgeInsets.only(right: 8),
                                          child: Obx(
                                            () => AppSuffixIcon(
                                              onTap: controller.passwordHasError
                                                          .value &&
                                                      controller
                                                          .passwordIsEmpty.value
                                                  ? null
                                                  : controller
                                                      .togglePasswordVisibility,
                                              hasError: controller
                                                      .passwordHasError.value &&
                                                  controller
                                                      .passwordIsEmpty.value,
                                              hasFocus: controller
                                                  .passwordHasFocus.value,
                                              isPassword: true,
                                              isObscureText: controller
                                                  .passwordObscureText.value,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 4),
                          InkWell(
                            onTap: () => Get.toNamed(
                              Routes.recoveryPasswordEmail,
                              arguments: controller.emailController.text
                                  .replaceAll(' ', ''),
                              parameters: {
                                'email': controller.emailController.text
                                    .replaceAll(' ', ''),
                              },
                            ),
                            child: Text(
                              'Esqueceu sua senha?',
                              style: context.textTheme.labelLarge?.copyWith(
                                color: AppColors.primary,
                              ),
                            ),
                          ),
                          SizedBox(height: isMobile ? 24 : 20),
                          Obx(
                            () => ElevatedButton(
                              onPressed: controller.isLoading.value
                                  ? null
                                  : controller.login,
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
                                      'ENTRAR',
                                      style: context.textTheme.bodyMedium
                                          ?.copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                            ),
                          ),
                          SizedBox(height: isMobile ? 48 : 36),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Primeiro acesso?',
                                style: context.textTheme.labelLarge?.copyWith(
                                  color: AppColors.textDark,
                                ),
                              ),
                              const SizedBox(width: 4),
                              Obx(
                                () => InkWell(
                                  onTap:
                                      controller.isLoading.value ? null : () {},
                                  child: Text(
                                    'Criar Conta',
                                    style:
                                        context.textTheme.labelLarge?.copyWith(
                                      color: AppColors.primary,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 17),
                          Obx(
                            () => InkWell(
                              onTap: controller.isLoading.value
                                  ? null
                                  : () =>
                                      controller.showHelpMeChat.value = true,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Icon(
                                    Icons.help_outline,
                                    color: AppColors.iconDark,
                                    size: 20,
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    'Me ajuda JG',
                                    style:
                                        context.textTheme.labelMedium?.copyWith(
                                      color: AppColors.text,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Obx(
              () => controller.showHelpMeChat.value
                  ? Center(
                      child: SizedBox(
                        width: isMobile ||
                                Responsive.figmaDesktopScreenWidth >
                                    MediaQuery.sizeOf(context).width
                            ? MediaQuery.sizeOf(context).width
                            : Responsive.figmaDesktopScreenWidth,
                        child: const Align(
                          alignment: Alignment.bottomRight,
                          child: Padding(
                            padding: EdgeInsets.only(right: 22),
                            child: HelpMeChat(),
                          ),
                        ),
                      ),
                    )
                  : const SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }
}
