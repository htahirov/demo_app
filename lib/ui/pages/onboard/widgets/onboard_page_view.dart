import 'package:flutter/material.dart';

import '../../../../extensions/context_extensions.dart';
import '../../../../models/onboard_model.dart';
import 'onboard_item.dart';

class OnboardPageView extends StatelessWidget {
  const OnboardPageView({
    super.key,
    required this.pageController,
  });

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    const items = OnboardModel.onboardItems;
    return SizedBox(
      height: context.fH / 2,
      child: PageView.builder(
        controller: pageController,
        itemCount: items.length,
        itemBuilder: (_, i) => OnboardItem(onboardItem: items[i]),
      ),
    );
  }
}
