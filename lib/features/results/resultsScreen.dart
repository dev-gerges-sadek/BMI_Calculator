// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tesk_count/core/colors_manger.dart';
import 'package:tesk_count/core/style.dart';

class ResultsScreen extends StatelessWidget {
  final double bmiResult;
  final String resultText;
  final String interpretation;

  const ResultsScreen({
    super.key,
    required this.bmiResult,
    required this.resultText,
    required this.interpretation,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.primaryColor,
      appBar: AppBar(
        backgroundColor: ColorsManager.primaryColor,
        elevation: 0,
        title: Text('BMI CALCULATOR', style: FontManager.primaryStyle),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
            child: Text(
              'Your Result',
              style: FontManager.primaryStyle.copyWith(fontSize: 35.sp),
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.all(15.w),
              decoration: BoxDecoration(
                color: ColorsManager.thirdColor,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    resultText.toUpperCase(),
                    style: TextStyle(
                      color: const Color(0xFF24D876),
                      fontSize: 22.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    bmiResult.toStringAsFixed(1),
                    style: FontManager.numberStyle.copyWith(fontSize: 50.sp),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    child: Text(
                      interpretation,
                      textAlign: TextAlign.center,
                      style: FontManager.secondaryStyle.copyWith(
                        fontSize: 18.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              color: ColorsManager.selectColor,
              width: double.infinity,
              height: 70.h,
              margin: EdgeInsets.only(top: 10.h),
              child: Center(
                child: Text(
                  'RE-CALCULATE',
                  style: FontManager.primaryStyle.copyWith(fontSize: 20.sp),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
