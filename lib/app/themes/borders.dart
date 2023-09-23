import 'package:flutter/material.dart';
import 'colors.dart';

const _style = BorderStyle.solid;
const _width = 1.0;

class AppBorders {
  static BoxBorder get input => Border.all(
        color: AppColors.inputBorder,
        style: _style,
        width: _width,
      );
}

extension BorderInput on BoxBorder {
  InputBorder get borderOutline => OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: top,
      );

  InputBorder get borderUnderline => UnderlineInputBorder(
        borderRadius: BorderRadius.circular(0),
        borderSide: bottom.copyWith(width: 1.0),
      );

  BoxBorder copyWithAll({
    Color? color,
    BorderStyle? style,
    double? width,
  }) {
    return Border.all(
      color: color ?? top.color,
      style: style ?? top.style,
      width: width ?? top.width,
    );
  }
}
