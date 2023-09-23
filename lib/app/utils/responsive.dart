import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/platform/platform.dart';

class Responsive {
  static const double minDesktopWidth = 400;
  static const double figmaDesktopScreenWidth = 720;

  static bool isMobile(BuildContext? context) {
    if (context == null) return false;
    return MediaQuery.sizeOf(context).width < minDesktopWidth;
  }

  static double ratioWidth(BuildContext context) =>
      MediaQuery.sizeOf(context).width / figmaDesktopScreenWidth;

  static get isDevice => (GetPlatform.isAndroid || GetPlatform.isIOS);
  static get isWebDevice => kIsWeb && isDevice;
}
