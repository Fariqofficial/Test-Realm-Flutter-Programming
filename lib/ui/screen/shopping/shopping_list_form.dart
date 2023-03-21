// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:test_android_programming_apps/controller/shopping/shopping_post_controller.dart';
import 'package:test_android_programming_apps/models/shopping/shopping_list_model.dart';
import 'package:test_android_programming_apps/shared/themes.dart';
import 'package:test_android_programming_apps/ui/widgets/custom_button.dart';
import 'package:test_android_programming_apps/ui/widgets/custom_input_description.dart';
import 'package:test_android_programming_apps/ui/widgets/custom_text_field.dart';

class ShoppingListForm extends StatefulWidget {
  final ShoppingListModel? item;

  const ShoppingListForm({
    super.key,
    this.item,
  });

  Widget build(context, ShoppingPostController controller) {
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
            'Set Up List',
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
                CustomInputDescription(
                  label: 'Description',
                  value: controller.description,
                  onChanged: (value) {
                    controller.description = value;
                  },
                  maxLength: 200,
                ),
                SizedBox(height: 16),
                CustomTextField(
                  label: 'Spend',
                  value: controller.spend,
                  onChanged: (value) {
                    controller.spend = value;
                  },
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
  State<ShoppingListForm> createState() => ShoppingPostController();
}
