import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../themes/colors.dart';
import '../../../themes/paths.dart';
import '../../../utils/responsive.dart';
import '../../../widgets/suffix_icon.dart';
import '../controllers/recovery_password_email_controller.dart';
import '../components/go_back_button.dart';
import '../components/header.dart';

class RecoveryPasswordEmailView
    extends GetView<RecoveryPasswordEmailController> {
  const RecoveryPasswordEmailView({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            const HeaderRecoveryPassword(imagePath: AppPaths.geniusHappy),
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
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset(
                        AppPaths.iconLogo,
                        fit: BoxFit.contain,
                        width: 42,
                        height: 42,
                      ),
                      const SizedBox(height: 30),
                      Text(
                        'Esqueceu sua senha?',
                        textAlign: TextAlign.center,
                        style: context.textTheme.headlineLarge,
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: 370,
                        child: Text(
                          'Não tem problema, a gente recupera rapidinho. '
                          'Mas antes, me fala qual o seu e-mail?',
                          style: context.textTheme.bodyLarge,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Form(
                        key: controller.formKey,
                        child: Column(
                          children: [
                            SizedBox(
                              width: 370,
                              child: TextFormField(
                                enabled: !controller.isLoading.value,
                                controller: controller.emailController,
                                validator: controller.validateEmail,
                                style: context.textTheme.labelLarge,
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  hintText: 'E-mail',
                                  suffixIcon: Padding(
                                    padding: const EdgeInsets.only(right: 8),
                                    child: Obx(
                                      () => AppSuffixIcon(
                                        hasError:
                                            controller.emailHasError.value,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 4),
                      const SizedBox(height: 20),
                      Obx(
                        () => ElevatedButton(
                          onPressed: controller.isLoading.value
                              ? null
                              : controller.isEmailAlreadyInUse,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            fixedSize: const Size(370, 48),
                          ),
                          child: controller.isLoading.value
                              ? const SizedBox(
                                  width: 25,
                                  height: 25,
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.white,
                                    ),
                                    strokeWidth: 3,
                                  ),
                                )
                              : Text(
                                  'CONTINUAR',
                                  style: context.textTheme.bodyMedium?.copyWith(
                                    color: Colors.white,
                                  ),
                                ),
                        ),
                      ),
                      const SizedBox(height: 36),
                      Obx(
                        () => InkWell(
                          onTap: controller.isLoading.value ? null : () {},
                          child: Text(
                            'Não lembra o seu e-mail?',
                            style: context.textTheme.labelLarge?.copyWith(
                              color: AppColors.primary,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
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
