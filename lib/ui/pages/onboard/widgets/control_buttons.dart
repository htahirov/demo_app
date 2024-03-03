import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../extensions/num_extensions.dart';
import '../../../../models/onboard_model.dart';
import '../../login/login_page.dart';
import 'rounded_control_button.dart';

class ControlButtons extends StatefulWidget {
  const ControlButtons({
    super.key,
    required this.pageController,
  });

  final PageController pageController;

  @override
  State<ControlButtons> createState() => _ControlButtonsState();
}

class _ControlButtonsState extends State<ControlButtons> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (currentIndex != widget.pageController.initialPage) ...[
          RoundedControlButton(
            onTap: () {
              widget.pageController.jumpToPage(currentIndex - 1);
              setState(() {});
            },
            icon: Icons.arrow_back_ios_new_rounded,
          ),
          56.w,
        ],
        RoundedControlButton(
          onTap: () async {
            if (!isLastPage) {
              widget.pageController.jumpToPage(currentIndex + 1);
              setState(() {});
              return;
            }

            final SharedPreferences preferences =
                await SharedPreferences.getInstance();
            await preferences.setBool('onboard', true).then((v) {
              log(v.toString());
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginPage(),
                ),
              );
            });
          },
          icon: isLastPage ? Icons.check : Icons.arrow_forward_ios_rounded,
        ),
      ],
    );
  }

  int get currentIndex => widget.pageController.page?.toInt() ?? 0;

  bool get isLastPage => currentIndex == OnboardModel.onboardItems.length - 1;
}
