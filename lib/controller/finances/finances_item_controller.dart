import 'package:flutter/material.dart';
import 'package:test_android_programming_apps/models/finances/finance_model.dart';
import 'package:test_android_programming_apps/service/finances/finance_service.dart';
import 'package:test_android_programming_apps/ui/screen/finances/finance_page.dart';
import 'package:test_android_programming_apps/utils/state_utils.dart';

class FinanceItemController extends State<FinancePage>
    implements MvcController {
  static late FinanceItemController instance;
  late FinancePage view;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  deleteItem(FinanceModel item) async {
    FinanceService.instance.delete(item);
  }
}
