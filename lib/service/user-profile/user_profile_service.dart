// ignore_for_file: avoid_print

import 'package:realm/realm.dart';
import 'package:test_android_programming_apps/models/user-profile/user_profile.dart';
import 'package:test_android_programming_apps/service/authentication/auth_service.dart';
import 'package:test_android_programming_apps/service/realm-base/realm_base_service.dart';

class UserProfileService extends RealmBaseService<UserProfile> {
  static UserProfileService? _instance;
  static UserProfileService get instance {
    _instance ??= UserProfileService();
    return _instance!;
  }

  UserProfileService() {
    realm = Realm(Configuration.flexibleSync(AuthService.currentUser!, [
      UserProfile.schema,
    ]));
  }

  @override
  Stream<RealmResultsChanges<UserProfile>> snapshot() {
    return UserProfileService.instance.realm
        .query<UserProfile>("TRUEPREDICATE SORT(_id ASC)")
        .changes;
  }

  @override
  Stream<RealmResultsChanges<UserProfile>> currentUserSnapshot() {
    return UserProfileService.instance.realm
        .query<UserProfile>("user_id == '${AuthService.currentUser!.id}'")
        .changes;
  }

  UserProfile myProfile() {
    return UserProfileService.instance.realm
        .query<UserProfile>("user_id == '${AuthService.currentUser!.id}'")
        .first;
  }

  iniUserProfile() async {
    var item = UserProfile(
      ObjectId(),
      AuthService.currentUser!.id,
      AuthService.currentUser!.profile.name ?? "-",
      AuthService.currentUser!.profile.email ?? "-",
    );

    realm.write(() {
      var res = UserProfileService.instance.get(
        query: "user_id == '${AuthService.currentUser!.id}'",
      );

      if (res.isEmpty) {
        var check = realm.add(item);
        print(check.toString());
        return;
      }

      UserProfile userProfile = (res.first as UserProfile);
      userProfile = item;
      print(userProfile.toString());
    });
  }

  Future<void> updateProfile({
    String? name,
  }) async {
    realm.write(() {
      var me = UserProfileService.instance.myProfile();
      me.name = name ?? me.name;
      print(me.toString());
    });
  }

  @override
  add(UserProfile item) async {
    realm.write(() {
      realm.add(item);
    });
    print("New user created");
  }

  @override
  delete(UserProfile item) async {
    realm.write(() {
      realm.delete(item);
    });
  }

  @override
  Future<void> update(UserProfile item) async {
    realm.write(() {
      item = item;
    });
  }
}
