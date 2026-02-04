// ignore_for_file: deprecated_member_use, file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tesk_count/core/colors_manger.dart';
import 'package:tesk_count/core/style.dart';
import 'package:tesk_count/features/cubit/cubit.dart';
import 'package:tesk_count/features/cubit/states.dart';
import 'package:tesk_count/features/home/widgets/generder_selection.dart';
import 'package:tesk_count/features/home/widgets/age&weight.dart';
import 'package:tesk_count/features/results/resultsScreen.dart';
import 'package:tesk_count/features/results/widgets/getResult.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.primaryColor,
      appBar: AppBar(
        backgroundColor: ColorsManager.primaryColor,
        title: Text("BMI CALCULATOR", style: FontManager.primaryStyle),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: [
          // Male / Female Section
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(15.w),
              child: BlocBuilder<BmiCubit, BmiState>(
                builder: (context, state) {
                  return Row(
                    children: [
                      Expanded(
                        child: GenerderSelection(
                          icon: Icons.male,
                          genderText: 'MALE',
                          onPress: () =>
                              context.read<BmiCubit>().selectGender('Male'),
                          isSelected: state.gender == 'Male',
                        ),
                      ),
                      SizedBox(width: 15.w),
                      Expanded(
                        child: GenerderSelection(
                          icon: Icons.female,
                          genderText: 'FEMALE',
                          onPress: () =>
                              context.read<BmiCubit>().selectGender('Female'),
                          isSelected: state.gender == 'Female',
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
          // Height Slider Section
          Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 15.w),
              decoration: BoxDecoration(
                color: ColorsManager.thirdColor,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("HEIGHT", style: FontManager.secondaryStyle),
                  BlocBuilder<BmiCubit, BmiState>(
                    builder: (context, state) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            state.height.toString(),
                            style: FontManager.numberStyle,
                          ),
                          Text("cm", style: FontManager.secondaryStyle),
                        ],
                      );
                    },
                  ),
                  BlocBuilder<BmiCubit, BmiState>(
                    builder: (context, state) {
                      return SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          activeTrackColor: ColorsManager.selectColor,
                          inactiveTrackColor: ColorsManager.textColor,
                          thumbColor: ColorsManager.selectColor,
                          overlayColor: ColorsManager.selectColor.withOpacity(
                            0.2,
                          ),
                          thumbShape: RoundSliderThumbShape(
                            enabledThumbRadius: 15.r,
                          ),
                        ),
                        child: Slider(
                          value: state.height.toDouble(),
                          min: 100.0,
                          max: 220.0,
                          onChanged: (value) =>
                              context.read<BmiCubit>().changeHeight(value),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          // Weight & Age Section
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(15.w),
              child: BlocBuilder<BmiCubit, BmiState>(
                builder: (context, state) {
                  return Row(
                    children: [
                      Expanded(
                        child: AgeWeight(
                          isAge: false,
                          age: state.age,
                          weight: state.weight,
                          onPress1: () =>
                              context.read<BmiCubit>().decreaseWeight(),
                          onPress2: () =>
                              context.read<BmiCubit>().increaseWeight(),
                        ),
                      ),
                      SizedBox(width: 15.w),
                      Expanded(
                        child: AgeWeight(
                          isAge: true,
                          age: state.age,
                          weight: state.weight,
                          onPress1: () =>
                              context.read<BmiCubit>().decreaseAge(),
                          onPress2: () =>
                              context.read<BmiCubit>().increaseAge(),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
          // Calculate Button
          GestureDetector(
            onTap: () {
              final state = context.read<BmiCubit>().state;
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultsScreen(
                    bmiResult: state.bmi,
                    resultText: getResultText(state.bmi),
                    interpretation: getInterpretation(state.bmi),
                  ),
                ),
              );
            },
            child: Container(
              color: ColorsManager.selectColor,
              height: 70.h,
              width: double.infinity,
              child: Center(
                child: Text(
                  'CALCULATE',
                  style: FontManager.primaryStyle.copyWith(fontSize: 22.sp),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
