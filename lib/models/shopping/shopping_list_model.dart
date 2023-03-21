import 'package:realm/realm.dart';

part 'shopping_list_model.g.dart';

@RealmModel()
class _ShoppingListModel {
  @MapTo('_id')
  @PrimaryKey()
  late ObjectId id;

  @MapTo('user_id')
  late String userId;

  @MapTo('title')
  late String title;

  @MapTo('description')
  late String description;

  @MapTo('spend')
  late String spend;
}