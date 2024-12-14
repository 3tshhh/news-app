import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/style/appColors.dart';

class AppStyle{
  static ThemeData lightTheme = ThemeData(
    textTheme: TextTheme(
      displayMedium: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 22.sp,
          color: AppColors.greyColor,
      ),
      titleLarge: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 24.sp,
        color: Colors.white
      )
    ),
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(
        size: 27.sp,
        color: Colors.white,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(50.r),
          bottomRight: Radius.circular(50.r),
        )
      ),
      backgroundColor: AppColors.lightPrimary,
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontFamily: "Exo",
        color: Colors.white,
        fontWeight: FontWeight.w400,
        fontSize: 22.sp,
      ),
    ),
    scaffoldBackgroundColor: Colors.transparent,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.lightPrimary,
      primary: AppColors.lightPrimary,
    )
  );
}