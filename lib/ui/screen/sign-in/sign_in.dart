// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:test_android_programming_apps/controller/sign-in/sign_In_controller.dart';
import 'package:test_android_programming_apps/shared/themes.dart';
import 'package:test_android_programming_apps/ui/screen/sign-up/sign_up.dart';
import 'package:test_android_programming_apps/ui/widgets/custom_button.dart';
import 'package:test_android_programming_apps/ui/widgets/custom_text_field.dart';
import 'package:test_android_programming_apps/utils/validator.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  Widget build(context, SignInController controller) {
    controller.view = this;

    Widget backgroundHeader() {
      return Container(
        height: 300,
        width: double.infinity,
        decoration: BoxDecoration(),
        child: Container(
          margin: EdgeInsets.only(top: 50),
          child: Column(
            children: [
              Text(
                'Test Android Programming',
                style: blackText.copyWith(
                  fontSize: 20,
                  fontWeight: semiBold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Image.asset(
                'assets/icon_logo.png',
                width: 150,
                height: 150,
              ),
            ],
          ),
        ),
      );
    }

    Widget inputSection() {
      return Container(
        margin: EdgeInsets.only(top: 20),
        child: ClipPath(
          clipper: WaveClipperTwo(reverse: true),
          child: Container(
            color: whiteColor,
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 60),
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Sign in to start\nthe system',
                        style: blackText.copyWith(
                          fontSize: 18,
                          fontWeight: semiBold,
                        ),
                      ),
                      SizedBox(height: 20),
                      CustomTextField(
                        label: 'Email Address',
                        validator: Validator.email,
                        value: controller.email,
                        onChanged: (value) {
                          controller.email = value;
                        },
                      ),
                      SizedBox(height: 16),
                      CustomTextField(
                        label: 'Password',
                        obscure: true,
                        value: controller.password,
                        validator: Validator.required,
                        onChanged: (value) {
                          controller.password = value;
                        },
                      ),
                      SizedBox(height: 20),
                      CustomButton(
                        text: 'Sign In',
                        onPressed: () {
                          controller.signInUser();
                        },
                      ),
                      SizedBox(height: 20),
                      CustomTextButton(
                        text: 'Create here!',
                        subText: 'Don\'t have an account?',
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignUp(),
                            ),
                          );
                        },
                      ),
                      SizedBox(height: 25),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: lightBgColor,
      body: SafeArea(
        child: ListView(
          children: [
            backgroundHeader(),
            inputSection(),
          ],
        ),
      ),
    );
  }

  @override
  State<SignIn> createState() => SignInController();
}
