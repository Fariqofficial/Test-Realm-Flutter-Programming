// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:test_android_programming_apps/service/authentication/auth_service.dart';
import 'package:test_android_programming_apps/service/realm/realm_service.dart';
import 'package:test_android_programming_apps/ui/screen/main_page.dart';
import 'package:test_android_programming_apps/ui/screen/sign-in/sign_in.dart';
import 'package:test_android_programming_apps/utils/state_utils.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  RealmService.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: Get.navigatorKey,
      home: AuthService.isLoggedIn
       ? MainPage() : SignIn().syncronizeRealm(),
      // routes: {
      //   '/': (context) => SignIn(),
      //   '/sign-up': (context) => SignUp(),
      //   '/home': (context) => HomePage(),
      //   '/main-page': (context) => MainPage(),
      // },
    );
  }
}
