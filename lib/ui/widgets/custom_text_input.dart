// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:test_android_programming_apps/shared/themes.dart';

class CustomTextInput extends StatelessWidget {
  final String text;
  final bool secureText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool isShowTitle;
  final Function(String)? onFieldSubmitted;

  const CustomTextInput({
    super.key,
    required this.text,
    this.secureText = false,
    this.controller,
    this.keyboardType,
    this.isShowTitle = true,
    this.onFieldSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (isShowTitle)
          Text(
            text,
            style: blackText.copyWith(
              fontWeight: medium,
            ),
          ),
        if (isShowTitle) SizedBox(height: 12),
        TextFormField(
          obscureText: secureText,
          controller: controller,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            hintText: !isShowTitle ? text : null,
            contentPadding: EdgeInsets.all(12),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
            ),
          ),
          onFieldSubmitted: onFieldSubmitted,
        ),
      ],
    );
  }
}
