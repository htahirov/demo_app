import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_radiuses.dart';
import '../../extensions/context_extensions.dart';
import '../../extensions/material_state_property_all_extensions.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    this.onPressed,
    this.isLoading = false,
  });

  final String text;
  final void Function()? onPressed;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: AppColors.red.mspAll,
        foregroundColor: AppColors.white.mspAll,
        fixedSize: Size(context.fW, 56).mspAll,
        shape: const RoundedRectangleBorder(
          borderRadius: AppRadiuses.a10,
        ).mspAll,
      ),
      onPressed: onPressed,
      child: !isLoading
          ? Text(text)
          : const SizedBox(
              height: 24,
              width: 24,
              child: CircularProgressIndicator(
                backgroundColor: AppColors.white,
              ),
            ),
    );
  }
}
