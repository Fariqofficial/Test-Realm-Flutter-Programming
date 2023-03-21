// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:test_android_programming_apps/controller/shopping/shopping_item_controller.dart';
import 'package:test_android_programming_apps/service/shopping/shopping_list_service.dart';
import 'package:test_android_programming_apps/shared/themes.dart';
import 'package:test_android_programming_apps/ui/screen/shopping/shopping_list_form.dart';
import 'package:test_android_programming_apps/ui/widgets/custom_button.dart';
import 'package:test_android_programming_apps/utils/state_utils.dart';

class ShoppingListPage extends StatefulWidget {
  const ShoppingListPage({super.key});

  Widget build(context, ShoppingItemController controller) {
    controller.view = this;

    return Scaffold(
      backgroundColor: lightBgColor,
      appBar: AppBar(
        backgroundColor: whiteColor,
        title: Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            "My Shopping List",
            style: darkText.copyWith(
              fontSize: 16,
              fontWeight: medium,
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: darkColor,
        child: const Icon(Icons.add),
        onPressed: () async {
          Get.to(ShoppingListForm());
        },
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child: StreamBuilder(
          stream: ShoppingListService.instance.snapshot(),
          builder: (context, snapshot) {
            if (snapshot.data == null) return Container();
            var items = snapshot.data!.results;
            return ListView.builder(
              itemCount: items.length,
              physics: const ScrollPhysics(),
              itemBuilder: (context, index) {
                var item = items[index];
                return Container(
                  padding: EdgeInsets.all(16),
                  margin: EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: whiteColor,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Title',
                        style: darkText.copyWith(
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 8),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          border: Border.all(width: 2),
                          borderRadius: BorderRadius.circular(16),
                          color: whiteColor,
                        ),
                        child: Text(
                          item.title,
                          style: blackText.copyWith(
                            fontSize: 14,
                            fontWeight: medium,
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                      Text(
                        'Description',
                        style: darkText.copyWith(
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 8),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          border: Border.all(width: 2),
                          borderRadius: BorderRadius.circular(16),
                          color: whiteColor,
                        ),
                        child: Text(
                          item.description,
                          style: blackText.copyWith(
                            fontSize: 14,
                            fontWeight: medium,
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                      Text(
                        'Today Spend',
                        style: darkText.copyWith(
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 8),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          border: Border.all(width: 2),
                          borderRadius: BorderRadius.circular(16),
                          color: whiteColor,
                        ),
                        child: Text(
                          item.spend,
                          style: blackText.copyWith(
                            fontSize: 14,
                            fontWeight: medium,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          CustomButton(
                            text: 'Edit',
                            width: 150,
                            onPressed: () {
                              Get.to(
                                ShoppingListForm(
                                  item: item,
                                ),
                              );
                            },
                          ),
                          SizedBox(width: 8),
                          CustomButton(
                            text: 'Hapus',
                            width: 150,
                            onPressed: () {
                              controller.deleteItems(item);
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }

  @override
  State<ShoppingListPage> createState() => ShoppingItemController();
}
