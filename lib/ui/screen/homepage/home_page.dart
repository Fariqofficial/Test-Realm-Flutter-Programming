// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:test_android_programming_apps/controller/to-do/to_do_item_controller.dart';
import 'package:test_android_programming_apps/service/to-do/to_do_service.dart';
import 'package:test_android_programming_apps/shared/themes.dart';
import 'package:test_android_programming_apps/ui/screen/homepage/to-do-form/to_do_form.dart';
import 'package:test_android_programming_apps/ui/widgets/custom_button.dart';
import 'package:test_android_programming_apps/utils/state_utils.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  Widget build(context, ToDoItemController controller) {
    controller.view = this;

    return Scaffold(
      backgroundColor: lightBgColor,
      appBar: AppBar(
        backgroundColor: whiteColor,
        title: Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            "Home",
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
          Get.to(ToDoForm());
        },
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child: StreamBuilder(
          stream: ToDoService.instance.snapshot(),
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
                        'Time',
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
                          item.time,
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
                                ToDoForm(
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
                              controller.deleteItem(item);
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
  State<HomePage> createState() => ToDoItemController();
}
