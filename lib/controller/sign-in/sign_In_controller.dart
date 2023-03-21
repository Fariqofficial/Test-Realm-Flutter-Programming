import 'package:flutter/material.dart';
import 'package:test_android_programming_apps/service/authentication/auth_service.dart';
import 'package:test_android_programming_apps/service/realm/realm_service.dart';
import 'package:test_android_programming_apps/shared/shared_method.dart';
import 'package:test_android_programming_apps/ui/screen/main_page.dart';
import 'package:test_android_programming_apps/ui/screen/sign-in/sign_in.dart';
import 'package:test_android_programming_apps/utils/show_loading.dart';
import 'package:test_android_programming_apps/utils/state_utils.dart';

class SignInController extends State<SignIn> implements MvcController {
  static late SignInController instance;
  late SignIn view;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  String email = "example@mail.com";
  String password = "password123";
  signInUser() async {
    showLoading();
    bool isLoggedIn = await AuthService.signIn(
      email: email,
      password: password,
    );

    if (!isLoggedIn) {
      hideLoading();
      showInfoDialog("Wrong email or password!");
      return;
    }

    await RealmService.syncronizeAll();

    hideLoading();
    Get.offAll(const MainPage());
  }
}
