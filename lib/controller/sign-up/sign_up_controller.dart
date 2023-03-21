import 'package:flutter/material.dart';
import 'package:test_android_programming_apps/service/authentication/auth_service.dart';
import 'package:test_android_programming_apps/service/realm/realm_service.dart';
import 'package:test_android_programming_apps/shared/shared_method.dart';
import 'package:test_android_programming_apps/ui/screen/main_page.dart';
import 'package:test_android_programming_apps/ui/screen/sign-up/sign_up.dart';
import 'package:test_android_programming_apps/utils/show_loading.dart';
import 'package:test_android_programming_apps/utils/state_utils.dart';

class SignUpController extends State<SignUp> implements MvcController {
  static late SignUpController instance;
  late SignUp view;

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

  signUpUser() async {
    showLoading();

    try {
      await AuthService.signUp(
        email: email,
        password: password,
      );
      await AuthService.signIn(
        email: email,
        password: password,
      );

      await RealmService.syncronizeAll();

      hideLoading();
      Get.offAll(const MainPage());
    } on Exception {
      hideLoading();
      showInfoDialog("Wrong email or password!");
      return;
    }

    // if (!isRegister) {
    //   hideLoading();
    //   showInfoDialog("Wrong email or password!");
    //   return;
    // }
  }
}
