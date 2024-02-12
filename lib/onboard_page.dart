import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OnboardPage extends StatelessWidget {
  const OnboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: ColoredBox(
        color: Colors.red,
        child: PageView.builder(
          itemCount: 4,
          itemBuilder: (context, index) {
            print('index: ${index + 1}');
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FadeIn(
                    child: Center(
                      child: SvgPicture.asset('assets/svg/logo.svg'),
                    ),
                  ),
                  Text('Title 1'),
                  Text('Description 1'),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
