import 'package:flutter/material.dart';
import 'package:gloabal_app/constants/app_colors.dart';

class AppTextStyles {
  AppTextStyles._();

  static const _w600s24Black54 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: Colors.black54,
  );

  static final loginTitleTextStyle = _w600s24Black54.copyWith(
    color: AppColors.red,
  );
  static const registerTitleTextStyle = _w600s24Black54;
}
