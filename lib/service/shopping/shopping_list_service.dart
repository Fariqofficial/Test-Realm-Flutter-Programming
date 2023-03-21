import 'package:realm/realm.dart';
import 'package:test_android_programming_apps/models/shopping/shopping_list_model.dart';
import 'package:test_android_programming_apps/models/todo-item/to_do_item.dart';
import 'package:test_android_programming_apps/service/authentication/auth_service.dart';
import 'package:test_android_programming_apps/service/realm-base/realm_base_service.dart';

class ShoppingListService extends RealmBaseService<ShoppingListModel> {
  static ShoppingListService? _instance;
  static ShoppingListService get instance {
    _instance ??= ShoppingListService();
    return _instance!;
  }

  //

  ShoppingListService() {
    realm = Realm(Configuration.flexibleSync(
      AuthService.currentUser!,
      [
        ShoppingListModel.schema,
      ],
    ));
  }

  @override
  Stream<RealmResultsChanges<ShoppingListModel>> snapshot() {
    return ShoppingListService.instance.realm
        .query<ShoppingListModel>("TRUEPREDICATE SORT(_id ASC)")
        .changes;
  }

  @override
  add(ShoppingListModel item) async {
    realm.write(() {
      realm.add(item);
    });
  }

  @override
  delete(ShoppingListModel item) {
    realm.write(() async {
      realm.delete(item);
    });
  }

  @override
  Future<void> update(
    ShoppingListModel item, {
    String? title,
    String? description,
    String? spend,
  }) async {
    realm.write(() {
      item.title = title ?? item.title;
      item.description = description ?? item.description;
      item.spend = spend ?? item.spend;
    });
  }
}
