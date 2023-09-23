import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../themes/colors.dart';

class TipsGoodsPasswords extends StatelessWidget {
  const TipsGoodsPasswords({super.key});

  @override
  Widget build(BuildContext context) {
    final itemStyle = context.textTheme.labelSmall?.copyWith(
      color: AppColors.primary,
      fontWeight: FontWeight.w600,
    );

    return SizedBox(
      width: 370,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          RichText(
            text: TextSpan(
              text: 'Dicas para uma boa senha: \n',
              style: context.textTheme.labelMedium,
              children: [
                TextSpan(
                  text: '• Ter pelo menos 5 caracteres\n',
                  style: itemStyle,
                ),
                TextSpan(
                  text: '• Ter letras minúsculas\n',
                  style: itemStyle,
                ),
                TextSpan(
                  text: '• Ter letras maiúsculas\n',
                  style: itemStyle,
                ),
                TextSpan(
                  text: '• Ter números ou caracteres especiais\n',
                  style: itemStyle,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
