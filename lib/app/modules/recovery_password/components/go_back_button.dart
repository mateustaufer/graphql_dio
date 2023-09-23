import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../../themes/colors.dart';

class GoBackButton extends StatelessWidget {
  const GoBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.offNamed(Routes.login),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.arrow_back,
            color: AppColors.iconDark,
            size: 24,
          ),
          const SizedBox(width: 4),
          Text(
            'Voltar',
            style: context.textTheme.labelMedium?.copyWith(
              color: AppColors.text,
            ),
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
