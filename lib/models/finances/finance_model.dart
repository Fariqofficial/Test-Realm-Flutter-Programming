import 'dart:ffi';

import 'package:realm/realm.dart';
part 'finance_model.g.dart';

@RealmModel()
class _FinanceModel {
  @MapTo('_id')
  @PrimaryKey()
  late ObjectId id;

  @MapTo('user_id')
  late String userId;

  @MapTo('title')
  late String title;

  @MapTo('spend')
  late String spend;

  @MapTo('description')
  late String description;
}
