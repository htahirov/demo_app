import 'package:flutter/material.dart';

import '../../../extensions/num_extensions.dart';
import 'widgets/control_buttons.dart';
import 'widgets/dot_indicator.dart';
import 'widgets/onboard_page_view.dart';
import 'widgets/skip_button.dart';

class OnboardPage extends StatefulWidget {
  const OnboardPage({super.key});

  @override
  State<OnboardPage> createState() => _OnboardPageState();
}

class _OnboardPageState extends State<OnboardPage> {
  late final _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: const [SkipButton()]),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          OnboardPageView(pageController: _pageController),
          24.h,
          DotIndicator(pageController: _pageController),
          48.h,
          ControlButtons(pageController: _pageController),
        ],
      ),
    );
  }
}
