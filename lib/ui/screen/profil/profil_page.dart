// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:test_android_programming_apps/controller/profile/profile_controller.dart';
import 'package:test_android_programming_apps/service/user-profile/user_profile_service.dart';
import 'package:test_android_programming_apps/shared/themes.dart';
import 'package:test_android_programming_apps/ui/widgets/custom_button.dart';
import 'package:test_android_programming_apps/ui/widgets/custom_text_field.dart';
import 'package:test_android_programming_apps/ui/widgets/custom_text_input.dart';
import 'package:test_android_programming_apps/utils/validator.dart';

class ProfilPage extends StatefulWidget {
  const ProfilPage({super.key});

  Widget build(context, ProfileController controller) {
    controller.view = this;
//
    return Scaffold(
      backgroundColor: lightBgColor,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: darkColor,
        ),
        backgroundColor: whiteColor,
        title: Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            'Profile',
            style: darkText.copyWith(
              fontSize: 16,
              fontWeight: medium,
            ),
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            StreamBuilder(
                stream: UserProfileService.instance.currentUserSnapshot(),
                builder: (context, snapshot) {
                  if (snapshot.data == null) return Container();
                  if (snapshot.data!.results.isEmpty) return Container();
                  var data = snapshot.data?.results.first;

                  return Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: whiteColor,
                    ),
                    child: Column(
                      children: [
                        CustomTextField(
                          label: 'Name',
                          validator: Validator.required,
                          value: data?.name,
                          onChanged: (value) {
                            UserProfileService.instance.updateProfile(
                              name: value,
                            );
                          },
                        ),
                        SizedBox(height: 16),
                        CustomTextField(
                          label: 'Email',
                          validator: Validator.email,
                          value: data?.email,
                          enabled: false,
                          onChanged: (value) {},
                        ),
                        SizedBox(height: 20),
                        CustomButton(
                          text: 'Logout',
                          onPressed: () {
                            controller.signOutUser();
                          },
                        ),
                      ],
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }

  @override
  State<ProfilPage> createState() => ProfileController();
}
