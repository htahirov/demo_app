import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gloabal_app/constants/app_colors.dart';
import 'package:gloabal_app/extensions/context_extensions.dart';
import 'package:gloabal_app/extensions/num_extensions.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../models/onboard_model.dart';
import '../widgets/onboard_item.dart';

class OnboardPage extends StatefulWidget {
  const OnboardPage({super.key});

  @override
  State<OnboardPage> createState() => _OnboardPageState();
}

class _OnboardPageState extends State<OnboardPage> {
  late final _pageController = PageController();
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const items = OnboardModel.onboardItems;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ColoredBox(
            color: AppColors.red,
            child: SizedBox(
              height: context.fH / 2,
              child: PageView.builder(
                controller: _pageController,
                itemCount: items.length,
                onPageChanged: (i) {
                  log('message');
                  if (i == items.length - 1) {
                    selectedIndex = 0;
                  } else {
                    selectedIndex = i;
                  }

                  setState(() {});
                },
                itemBuilder: (_, i) => OnboardItem(onboardItem: items[i]),
              ),
            ),
          ),
          24.h,
          SmoothPageIndicator(
            controller: _pageController,
            count: items.length,
            effect: const WormEffect(
              activeDotColor: AppColors.red,
              dotHeight: 12,
              dotWidth: 12,
              spacing: 4,
            ),
            onDotClicked: (i) => _pageController.jumpToPage(i),
          ),
        ],
      ),
    );
  }
}
