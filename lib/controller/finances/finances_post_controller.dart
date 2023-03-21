import 'package:flutter/material.dart';
import 'package:realm/realm.dart';
import 'package:test_android_programming_apps/models/finances/finance_model.dart';
import 'package:test_android_programming_apps/service/authentication/auth_service.dart';
import 'package:test_android_programming_apps/service/finances/finance_service.dart';
import 'package:test_android_programming_apps/ui/screen/finances/finance_form_page.dart';
import 'package:test_android_programming_apps/utils/state_utils.dart';

class FinancePostController extends State<FinanceFormPage>
    implements MvcController {
  static late FinancePostController instance;
  late FinanceFormPage view;

  @override
  void initState() {
    instance = this;
    if (isEditMode) {
      title = widget.item!.title;
      spend = widget.item!.spend;
      desc = widget.item!.description;
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
  String? spend;
  String? desc;
  saveItems() async {
    if (isEditMode) {
      FinanceService.instance.update(
        widget.item!,
        title: title,
        spend: spend,
        desc: desc,
      );
    } else {
      FinanceService.instance.add(FinanceModel(
        ObjectId(),
        AuthService.currentUser!.id,
        title!,
        spend!,
        desc!,
      ));
    }
    Get.back();
  }
}
