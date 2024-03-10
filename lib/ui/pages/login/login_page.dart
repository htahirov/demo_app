import 'dart:developer';

import 'package:flutter/material.dart';

import 'index.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final dateController = TextEditingController();
  late final FocusNode usernameFocus = FocusNode();
  late final FocusNode passwordFocus = FocusNode();
  late final formKey = GlobalKey<FormState>();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FormScrollColumn(
          formKey: formKey,
          children: [
            Text(AppTexts.login, style: AppTextStyles.loginTitleTextStyle),
            40.h,
            CustomInput(
              prefix: Icons.person,
              hint: AppTexts.username,
              focus: usernameFocus,
              onFieldSubmitted: (v) =>
                  FocusScope.of(context).requestFocus(passwordFocus),
              validator: (v) {
                if (v == null || v.isEmpty) {
                  return 'Please enter  a username';
                }
                return null;
              },
            ),
            16.h,
            CustomInput(
              hint: AppTexts.password,
              prefix: Icons.key,
              isObsecure: true,
              focus: passwordFocus,
              validator: (v) {
                if (v == null || v.isEmpty) {
                  return 'Please enter a password';
                }
                return null;
              },
            ),
            24.h,
            CustomButton(
              text: AppTexts.login,
              isLoading: isLoading,
              onPressed: () async {
                if (formKey.currentState!.validate()) {
                  log('Successfully login');
                  isLoading = true;
                  setState(() {});
                  await Future.delayed(Durations.extralong4 * 2);
                  isLoading = false;
                  setState(() {});
                  return;
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
