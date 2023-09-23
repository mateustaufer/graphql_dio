import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../themes/colors.dart';
import '../../../themes/paths.dart';
import '../../../utils/date_input_formatter.dart';
import '../../../utils/responsive.dart';
import '../../../widgets/suffix_icon.dart';
import '../components/go_back_button.dart';
import '../components/header.dart';
import '../controllers/recovery_password_birth_date_controller.dart';

class RecoveryPasswordBirthOfDateView
    extends GetView<RecoveryPasswordBirthDateController> {
  const RecoveryPasswordBirthOfDateView({super.key});

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
                        'Me diz sua data de nascimento?',
                        textAlign: TextAlign.center,
                        style: context.textTheme.headlineLarge,
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: 370,
                        child: Text(
                          'Consegui encontrar seu e-mail! \nAgora, vou '
                          'precisar da sua data de nascimento.',
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
                                keyboardType: TextInputType.datetime,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                  DataInputFormatter()
                                ],
                                controller: controller.birthDateController,
                                validator: controller.validateBirthOfDate,
                                style: context.textTheme.labelLarge,
                                decoration: InputDecoration(
                                  hintText: 'Data de nascimento',
                                  suffixIcon: Padding(
                                    padding: const EdgeInsets.only(right: 8),
                                    child: Obx(
                                      () => AppSuffixIcon(
                                        hasError:
                                            controller.birthDateHasError.value,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),
                      Obx(
                        () => ElevatedButton(
                          onPressed: controller.isLoading.value
                              ? null
                              : controller.getUserIdByEmailAndBirthdayDate,
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
                            'Não sabe sua data de nascimento?',
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
