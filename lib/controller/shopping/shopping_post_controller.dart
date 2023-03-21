// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:realm/realm.dart';
import 'package:test_android_programming_apps/models/shopping/shopping_list_model.dart';
import 'package:test_android_programming_apps/service/authentication/auth_service.dart';
import 'package:test_android_programming_apps/service/shopping/shopping_list_service.dart';
import 'package:test_android_programming_apps/ui/screen/shopping/shopping_list_form.dart';
import 'package:test_android_programming_apps/utils/state_utils.dart';

class ShoppingPostController extends State<ShoppingListForm>
    implements MvcController {
  static late ShoppingPostController instance;
  late ShoppingListForm view;

  @override
  void initState() {
    instance = this;
    if (isEditMode) {
      title = widget.item!.title;
      description = widget.item!.description;
      spend = widget.item!.spend;
    }
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  bool get isEditMode {
    return widget.item != null;
  }

  String? title;
  String? description;
  String? spend;
  saveItems() async {
    if (isEditMode) {
      print("update ${widget.item!.id}");

      ShoppingListService.instance.update(
        widget.item!,
        title: title,
        description: description,
        spend: spend,
      );
    } else {
      ShoppingListService.instance.add(
        ShoppingListModel(
          ObjectId(),
          AuthService.currentUser!.id,
          title!,
          description!,
          spend!,
        ),
      );
    }
    Get.back();
  }
}
