import 'package:flutter/material.dart';
import 'package:test_android_programming_apps/models/shopping/shopping_list_model.dart';
import 'package:test_android_programming_apps/service/shopping/shopping_list_service.dart';
import 'package:test_android_programming_apps/ui/screen/shopping/shopping_list_page.dart';
import 'package:test_android_programming_apps/utils/state_utils.dart';

class ShoppingItemController extends State<ShoppingListPage>
    implements MvcController {
  static late ShoppingItemController instance;
  late ShoppingListPage view;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  deleteItems(ShoppingListModel item) async {
    ShoppingListService.instance.delete(item);
  }
}
