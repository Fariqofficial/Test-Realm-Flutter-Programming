import 'package:test_android_programming_apps/service/finances/finance_service.dart';
import 'package:test_android_programming_apps/service/shopping/shopping_list_service.dart';
import 'package:test_android_programming_apps/service/to-do/to_do_service.dart';
import 'package:test_android_programming_apps/service/user-profile/user_profile_service.dart';

class SharedConfig {
  static String appId = "application-0-wfiye";
  static String baseUrl = "https://realm.mongodb.com";
  static String dataSourceName = "mongodb-atlas";
  static String appUrl =
      "https://realm.mongodb.com/groups/6414efded881410a0b871dbc/apps/6416ae5b3450815b9d304cd";
}

class RealmSyncronizer {
  static syncronize() async {
    await ToDoService.instance.syncronize();
    await FinanceService.instance.syncronize();
    await ShoppingListService.instance.syncronize();
    await UserProfileService.instance.syncronize();
  }
}
