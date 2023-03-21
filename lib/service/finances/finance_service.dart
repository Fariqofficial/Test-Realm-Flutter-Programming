import 'package:realm/realm.dart';
import 'package:test_android_programming_apps/models/finances/finance_model.dart';
import 'package:test_android_programming_apps/service/authentication/auth_service.dart';
import 'package:test_android_programming_apps/service/realm-base/realm_base_service.dart';

class FinanceService extends RealmBaseService<FinanceModel> {
  static FinanceService? _instance;
  static FinanceService get instance {
    _instance ??= FinanceService();
    return _instance!;
  }

  FinanceService() {
    realm = Realm(Configuration.flexibleSync(
      AuthService.currentUser!,
      [
        FinanceModel.schema,
      ],
    ));
  }

  @override
  Stream<RealmResultsChanges<FinanceModel>> snapshot() {
    return FinanceService.instance.realm
        .query<FinanceModel>("TRUEPREDICATE SORT(_id ASC)")
        .changes;
  }

  @override
  add(FinanceModel item) async {
    realm.write(() {
      realm.add(item);
    });
  }

  @override
  delete(FinanceModel item) {
    realm.write(() async {
      realm.delete(item);
    });
  }

  @override
  Future<void> update(
    FinanceModel item, {
    String? title,
    String? spend,
    String? desc,
  }) async {
    realm.write(() {
      item.title = title ?? item.title;
      item.spend = spend ?? item.spend;
      item.description = desc ?? item.description;
    });
  }
}
