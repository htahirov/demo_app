import 'package:flutter/material.dart';

import '../../../../constants/app_colors.dart';

class RoundedControlButton extends StatelessWidget {
  const RoundedControlButton({
    super.key,
    required this.onTap,
    required this.icon,
  });

  final void Function() onTap;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      style: IconButton.styleFrom(
        backgroundColor: AppColors.red,
        foregroundColor: AppColors.white,
      ),
      onPressed: onTap,
      icon: Icon(
        icon,
      ),
    );
  }
}
