import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../themes/borders.dart';
import '../../../../themes/colors.dart';
import '../../controllers/login_controller.dart';

class HelpMeChat extends GetView<LoginController> {
  const HelpMeChat({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 364,
      height: 542,
      decoration: BoxDecoration(
        color: AppColors.backgroundHelpMeChat,
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              width: 364,
              height: 127,
              decoration: const BoxDecoration(
                color: AppColors.headerHelpMeChat,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      onPressed: () => controller.showHelpMeChat.value = false,
                      icon: const Icon(
                        Icons.close,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(
              top: 105,
              left: 10,
              right: 10,
              bottom: 62,
            ),
            height: 442,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: 364,
              height: 53,
              color: Colors.white,
              child: TextFormField(
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  hintText: 'Responda aqui...',
                  hintStyle: context.textTheme.labelLarge?.copyWith(
                    color: AppColors.hintTextLight,
                  ),
                  border: AppBorders.input
                      .copyWithAll(color: Colors.transparent)
                      .borderOutline,
                  enabledBorder: AppBorders.input
                      .copyWithAll(color: Colors.transparent)
                      .borderOutline,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
