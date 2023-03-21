import 'package:realm/realm.dart';
part 'to_do_item.g.dart';

@RealmModel()
class _ToDoItem {
  @MapTo('_id')
  @PrimaryKey()
  late ObjectId id;

  @MapTo('user_id')
  late String userId;

  @MapTo('title')
  late String title;

  @MapTo('description')
  late String description;

  @MapTo('time')
  late String time;
}
