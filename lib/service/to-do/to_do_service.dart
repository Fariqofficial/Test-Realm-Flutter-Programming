import 'package:realm/realm.dart';
import 'package:test_android_programming_apps/models/todo-item/to_do_item.dart';
import 'package:test_android_programming_apps/service/authentication/auth_service.dart';
import 'package:test_android_programming_apps/service/realm-base/realm_base_service.dart';

class ToDoService extends RealmBaseService<ToDoItem> {
  static ToDoService? _instance;
  static ToDoService get instance {
    _instance ??= ToDoService();
    return _instance!;
  }

  ToDoService() {
    realm = Realm(Configuration.flexibleSync(
      AuthService.currentUser!,
      [
        ToDoItem.schema,
      ],
    ));
  }

  @override
  Stream<RealmResultsChanges<ToDoItem>> snapshot() {
    return ToDoService.instance.realm
        .query<ToDoItem>("TRUEPREDICATE SORT(_id ASC)")
        .changes;
  }

  @override
  add(ToDoItem item) async {
    realm.write(() {
      realm.add(item);
    });
  }

  @override
  delete(ToDoItem item) {
    realm.write(() async {
      realm.delete(item);
    });
  }

  @override
  Future<void> update(
    ToDoItem item, {
    String? title,
    String? description,
    String? time,
  }) async {
    realm.write(() {
      item.title = title ?? item.title;
      item.description = description ?? item.description;
      item.time = time ?? item.time;
    });
  }
}
