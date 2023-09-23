import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../themes/colors.dart';
import '../../../utils/responsive.dart';

class HeaderRecoveryPassword extends StatelessWidget {
  final String imagePath;

  const HeaderRecoveryPassword({required this.imagePath, super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        height: 200,
        width: isMobile ||
                Responsive.figmaDesktopScreenWidth >
                    MediaQuery.of(context).size.width
            ? MediaQuery.of(context).size.width
            : Responsive.figmaDesktopScreenWidth,
        padding: const EdgeInsets.only(top: 12),
        color: AppColors.backgroundResetPassword,
        child: SvgPicture.asset(imagePath),
      ),
    );
  }
}
