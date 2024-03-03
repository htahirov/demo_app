import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../constants/app_colors.dart';
import '../../../../models/onboard_model.dart';

class DotIndicator extends StatelessWidget {
  const DotIndicator({
    super.key,
    required this.pageController,
  });

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    const items = OnboardModel.onboardItems;
    return SmoothPageIndicator(
      controller: pageController,
      count: items.length,
      effect: const WormEffect(
        activeDotColor: AppColors.red,
        dotHeight: 12,
        dotWidth: 12,
        spacing: 4,
      ),
      onDotClicked: (i) => pageController.jumpToPage(i),
    );
  }
}
