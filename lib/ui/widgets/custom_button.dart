// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:test_android_programming_apps/shared/themes.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final double width;
  final double height;
  final VoidCallback? onPressed;

  const CustomButton({
    super.key,
    required this.text,
    this.width = double.infinity,
    this.height = 50,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: darkColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(55),
          ),
        ),
        child: Text(
          text,
          style: whiteText.copyWith(
            fontSize: 16,
            fontWeight: semiBold,
          ),
        ),
      ),
    );
  }
}

class CustomTextButton extends StatelessWidget {
  final String text;
  final String subText;
  final VoidCallback? onPressed;

  const CustomTextButton({
    super.key,
    required this.text,
    required this.subText,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          subText,
          style: greyText.copyWith(
            fontSize: 16,
            fontWeight: medium,
          ),
        ),
        SizedBox(width: 5),
        TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
          ),
          child: Text(
            text,
            style: darkText.copyWith(
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }
}
