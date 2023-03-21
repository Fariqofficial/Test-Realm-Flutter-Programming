// ignore_for_file: avoid_print

import 'package:realm/realm.dart';
import 'package:test_android_programming_apps/service/realm/realm_service.dart';
import 'package:test_android_programming_apps/service/user-profile/user_profile_service.dart';

class AuthService {
  static User? _currentUser;
  static User? get currentUser {
    _currentUser ??= RealmService.app.currentUser;
    return _currentUser;
  }

  static Future<bool> signIn({
    required String email,
    required String password,
  }) async {
    try {
      print(currentUser);

      _currentUser = await RealmService.app.logIn(
        Credentials.emailPassword(email, password),
      );

      await RealmService.syncronizeAll();
      await UserProfileService.instance.iniUserProfile();

      return true;
    } on Exception catch (err) {
      print("$err");
      return false;
    }
  }

  static Future<bool> signUp({
    required String email,
    required String password,
  }) async {
    try {
      EmailPasswordAuthProvider authProvider =
          EmailPasswordAuthProvider(RealmService.app);
      await authProvider.registerUser(email, password);
      return true;
    } on Exception catch (err) {
      print("$err");
      return false;
    }
  }

  static Future signOut() async {
    await RealmService.app.removeUser(AuthService._currentUser!);
  }

  static bool get isLoggedIn {
    bool isLoggedIn = RealmService.app.currentUser != null;
    if (isLoggedIn) {
      AuthService._currentUser = RealmService.app.currentUser;
    }
    return isLoggedIn;
  }
}
