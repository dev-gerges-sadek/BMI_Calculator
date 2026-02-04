import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'colors_manger.dart';

class FontManager {
  static TextStyle primaryStyle = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.bold,
    color: ColorsManager.secondaryColor,
  );

  static TextStyle secondaryStyle = TextStyle(
    color: ColorsManager.textColor,
    fontSize: 20.sp,
    fontWeight: FontWeight.bold,
  );

  static TextStyle numberStyle = TextStyle(
    fontSize: 28.sp,
    fontWeight: FontWeight.w900,
    color: ColorsManager.secondaryColor,
  );
}
