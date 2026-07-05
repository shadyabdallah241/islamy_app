import 'package:flutter/material.dart';
import 'app_color.dart';

class AppTextStyles {
  static String fontFamily = "Janna LT";
  static FontWeight fontWeight = .bold;

  static TextStyle base(double size, Color color) {
    return TextStyle(fontFamily: fontFamily, fontSize: size, color: color);
  }

  static TextStyle font24Gold = base(24, AppColors.gold);
  static TextStyle font20Gold = base(20, AppColors.gold);
  static TextStyle font16Gold = base(16, AppColors.gold);
  static TextStyle font14Gold = base(14, AppColors.gold);

  static TextStyle font24White = base(24, AppColors.white);
  static TextStyle font20White = base(20, AppColors.white);
  static TextStyle font16White = base(16, AppColors.white);
  static TextStyle font14White = base(14, AppColors.white);

  static TextStyle font24Black = base(24, AppColors.black);
  static TextStyle font20Black = base(20, AppColors.black);
  static TextStyle font16Black = base(16, AppColors.black);
  static TextStyle font14Black = base(14, AppColors.black);

  static TextStyle font24offWhite = base(24, AppColors.offWhite);
  static TextStyle font20offWhite = base(20, AppColors.offWhite);
  static TextStyle font16offWhite = base(16, AppColors.offWhite);
  static TextStyle font14offWhite = base(14, AppColors.offWhite);

  static TextStyle font24Transparent = base(24, Colors.transparent);
  static TextStyle font20Transparent = base(20, Colors.transparent);
  static TextStyle font16Transparent = base(16, Colors.transparent);
  static TextStyle font14Transparent = base(14, Colors.transparent);
}
