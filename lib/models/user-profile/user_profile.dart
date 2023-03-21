import 'package:realm/realm.dart';
part 'user_profile.g.dart';

@RealmModel()
class _UserProfile {
  @MapTo('_id')
  @PrimaryKey()
  late ObjectId id;
  
 @MapTo('user_id')
  late String userId;

  @MapTo('name')
  late String name;

  @MapTo('email')
  late String email;

}
