import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tesk_count/core/colors_manger.dart';
import 'package:tesk_count/core/style.dart';

class GenerderSelection extends StatelessWidget {
  final IconData icon;
  final String genderText;
  final VoidCallback onPress;
  final bool isSelected;

  const GenerderSelection({
    super.key,
    required this.icon,
    required this.genderText,
    required this.onPress,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        decoration: BoxDecoration(
          // لو تم الاختيار نستخدم اللون الوردي، لو لا نستخدم لون الكارت الغامق
          color: isSelected ? ColorsManager.selectColor : ColorsManager.thirdColor,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: ColorsManager.secondaryColor,
              size: 80.r,
            ),
            SizedBox(height: 15.h),
            Text(
              genderText,
              style: isSelected 
                  ? FontManager.primaryStyle.copyWith(fontSize: 18.sp)
                  : FontManager.secondaryStyle.copyWith(fontSize: 18.sp),
            ),
          ],
        ),
      ),
    );
  }
}