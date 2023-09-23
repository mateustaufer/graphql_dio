import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/local_storage/local_storage.dart';
import '../../../routes/app_pages.dart';
import '../../../themes/colors.dart';
import '../../../utils/responsive.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return Scaffold(
      body: Align(
        alignment: Alignment.topCenter,
        child: Container(
          alignment: Alignment.center,
          width: isMobile ||
                  MediaQuery.sizeOf(context).width <
                      Responsive.figmaDesktopScreenWidth
              ? MediaQuery.sizeOf(context).width
              : Responsive.figmaDesktopScreenWidth,
          color: AppColors.snackbarBackgroundSuccess,
          child: ElevatedButton(
            onPressed: () async {
              await LocalStorage.erase();
              Get.offAllNamed(Routes.login);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              fixedSize: const Size(320, 48),
            ),
            child: Text(
              'LOGOUT',
              style:
                  context.textTheme.bodyMedium?.copyWith(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
