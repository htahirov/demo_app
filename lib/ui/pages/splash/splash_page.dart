import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gloabal_app/constants/app_assets.dart';
import 'package:gloabal_app/constants/app_texts.dart';

import '../onboard/onboard_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2)).whenComplete(() {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => const OnboardPage(),
        ),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff3A906D),
        foregroundColor: Colors.white,
        title: const Text(AppTexts.splashPage),
      ),
      body: FadeInLeftBig(
        child: Center(
          child: SvgPicture.asset(AppAssets.logo),
        ),
      ),
    );
  }
}
