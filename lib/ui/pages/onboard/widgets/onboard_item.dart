import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../constants/app_assets.dart';
import '../../../../extensions/num_extensions.dart';
import '../../../../models/onboard_model.dart';

class OnboardItem extends StatelessWidget {
  const OnboardItem({
    super.key,
    required this.onboardItem,
  });

  final OnboardModel onboardItem;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FadeIn(
            child: Center(
              child: SvgPicture.asset(AppAssets.logo),
            ),
          ),
          24.h,
          Text(
            onboardItem.title,
            style: const TextStyle(fontSize: 24),
          ),
          8.h,
          Text(
            onboardItem.description,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
