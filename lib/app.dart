import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'ui/pages/login/login_page.dart';
import 'ui/pages/onboard/onboard_page.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  bool? isShowedOnborad;

  @override
  void initState() {
    getOnboardShowed();
    super.initState();
  }

  void getOnboardShowed() async {
    final preferences = await SharedPreferences.getInstance();
    isShowedOnborad = preferences.getBool('onboard');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: isShowedOnborad == true ? const LoginPage() : const OnboardPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
