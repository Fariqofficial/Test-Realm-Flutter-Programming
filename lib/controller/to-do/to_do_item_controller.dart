import 'package:flutter/material.dart';
import 'package:test_android_programming_apps/models/todo-item/to_do_item.dart';
import 'package:test_android_programming_apps/service/to-do/to_do_service.dart';
import 'package:test_android_programming_apps/ui/screen/homepage/home_page.dart';
import 'package:test_android_programming_apps/utils/state_utils.dart';

class ToDoItemController extends State<HomePage> implements MvcController {
  static late ToDoItemController instance;
  late HomePage view;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  deleteItem(ToDoItem item) async {
    ToDoService.instance.delete(item);
  }
}
