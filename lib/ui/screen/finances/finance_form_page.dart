// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:test_android_programming_apps/controller/finances/finances_post_controller.dart';
import 'package:test_android_programming_apps/models/finances/finance_model.dart';
import 'package:test_android_programming_apps/shared/themes.dart';
import 'package:test_android_programming_apps/ui/widgets/custom_button.dart';
import 'package:test_android_programming_apps/ui/widgets/custom_input_description.dart';
import 'package:test_android_programming_apps/ui/widgets/custom_text_field.dart';

class FinanceFormPage extends StatefulWidget {
  final FinanceModel? item;
  const FinanceFormPage({
    super.key,
    this.item,
  });

  Widget build(context, FinancePostController controller) {
    controller.view = this;

    return Scaffold(
      backgroundColor: lightBgColor,
      appBar: AppBar(
        backgroundColor: whiteColor,
        iconTheme: IconThemeData(
          color: darkColor,
        ),
        title: Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            'Set Up Financial',
            style: darkText.copyWith(
              fontSize: 16,
              fontWeight: medium,
            ),
          ),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        children: [
          Container(
            margin: EdgeInsets.only(top: 40),
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: whiteColor,
            ),
            child: Column(
              children: [
                CustomTextField(
                  label: 'Title',
                  value: controller.title,
                  onChanged: (value) {
                    controller.title = value;
                  },
                ),
                SizedBox(height: 16),
                CustomTextField(
                  label: 'Spend',
                  value: controller.spend,
                  onChanged: (value) {
                    controller.spend = value;
                  },
                ),
                SizedBox(height: 16),
                CustomInputDescription(
                  label: 'Description',
                  value: controller.desc,
                  onChanged: (value) {
                    controller.desc = value;
                  },
                  maxLength: 200,
                ),
                SizedBox(height: 20),
                CustomButton(
                  text: 'Save',
                  onPressed: () {
                    controller.saveItems();
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  State<FinanceFormPage> createState() => FinancePostController();
}
