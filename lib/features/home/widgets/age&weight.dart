// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tesk_count/core/colors_manger.dart';
import 'package:tesk_count/core/style.dart';
import 'package:tesk_count/features/home/widgets/round_icon.dart';

class AgeWeight extends StatelessWidget {
  final bool isAge;
  final int age;
  final int weight;
  final VoidCallback onPress1;
  final VoidCallback onPress2;

  const AgeWeight({
    super.key,
    required this.isAge,
    required this.age,
    required this.weight,
    required this.onPress1,
    required this.onPress2,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorsManager.thirdColor,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            isAge ? 'AGE' : 'WEIGHT',
            style: FontManager.secondaryStyle.copyWith(fontSize: 18.sp),
          ),
          Text(
            isAge ? age.toString() : weight.toString(),
            style: FontManager.numberStyle,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RoundIconButton(icon: Icons.remove, onPressed: onPress1),
              SizedBox(width: 15.w),
              RoundIconButton(icon: Icons.add, onPressed: onPress2),
            ],
          ),
        ],
      ),
    );
  }
}
