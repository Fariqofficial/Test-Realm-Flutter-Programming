import 'package:flutter/material.dart';
import 'package:realm/realm.dart';
import 'package:test_android_programming_apps/models/todo-item/to_do_item.dart';
import 'package:test_android_programming_apps/service/authentication/auth_service.dart';
import 'package:test_android_programming_apps/service/to-do/to_do_service.dart';
import 'package:test_android_programming_apps/ui/screen/homepage/to-do-form/to_do_form.dart';
import 'package:test_android_programming_apps/utils/state_utils.dart';

class ToDoPostController extends State<ToDoForm> implements MvcController {
  static late ToDoPostController instance;
  late ToDoForm view;

  @override
  void initState() {
    instance = this;
    if (isEditMode) {
      title = widget.item!.title;
      desc = widget.item!.description;
      time = widget.item!.time;
    }
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  bool get isEditMode {
    return widget.item != null;
  }

  String? title;
  String? desc;
  String? time;
  saveItems() async {
    if (isEditMode) {
      ToDoService.instance.update(
        widget.item!,
        title: title,
        description: desc,
        time: time,
      );
    } else {
      ToDoService.instance.add(ToDoItem(
        ObjectId(),
        AuthService.currentUser!.id,
        title!,
        desc!,
        time!,
      ));
    }
    Get.back();
  }
}
