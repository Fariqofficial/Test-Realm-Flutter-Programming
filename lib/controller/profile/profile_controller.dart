// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:test_android_programming_apps/service/authentication/auth_service.dart';
import 'package:test_android_programming_apps/ui/screen/profil/profil_page.dart';
import 'package:test_android_programming_apps/ui/screen/sign-in/sign_in.dart';
import 'package:test_android_programming_apps/utils/show_loading.dart';
import 'package:test_android_programming_apps/utils/state_utils.dart';

class ProfileController extends State<ProfilPage> implements MvcController {
  static late ProfileController instance;
  late ProfilPage view;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  signOutUser() async {
    await AuthService.signOut();
    hideLoading();
    Get.offAll(SignIn());
  }
}
