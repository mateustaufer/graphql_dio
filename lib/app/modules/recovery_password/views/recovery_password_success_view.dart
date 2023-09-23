import 'package:exploradores/app/data/local_storage/local_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../themes/colors.dart';
import '../../../themes/paths.dart';
import '../../../utils/responsive.dart';
import '../components/header.dart';
import '../controllers/recovery_password_success_controller.dart';

class RecoveryPasswordSuccessView extends StatefulWidget {
  const RecoveryPasswordSuccessView({super.key});

  @override
  State<RecoveryPasswordSuccessView> createState() =>
      _RecoveryPasswordSuccessViewState();
}

class _RecoveryPasswordSuccessViewState
    extends State<RecoveryPasswordSuccessView> {
  final controller = Get.find<RecoveryPasswordSuccessController>();
  @override
  void dispose() {
    LocalStorage.removeData(key: 'userPassword');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            const HeaderRecoveryPassword(imagePath: AppPaths.geniusLove),
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
                        'Senha alterada!',
                        textAlign: TextAlign.center,
                        style: context.textTheme.headlineLarge,
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: 350,
                        child: Text(
                          'Prontinho, sua senha foi alterada e você já pode '
                          'acessar a plataforma da Jovens Gênios!',
                          style: context.textTheme.bodyLarge,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(height: 24),
                      Obx(
                        () => ElevatedButton(
                          onPressed: controller.isLoading.value
                              ? null
                              : controller.login,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            fixedSize: const Size(320, 48),
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
                                  'ACESSAR PLATAFORMA',
                                  style: context.textTheme.bodyMedium?.copyWith(
                                    color: Colors.white,
                                  ),
                                ),
                        ),
                      ),
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
