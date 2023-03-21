// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:test_android_programming_apps/controller/sign-up/sign_up_controller.dart';
import 'package:test_android_programming_apps/shared/shared_method.dart';
import 'package:test_android_programming_apps/shared/themes.dart';
import 'package:test_android_programming_apps/ui/screen/sign-in/sign_in.dart';
import 'package:test_android_programming_apps/ui/widgets/custom_button.dart';
import 'package:test_android_programming_apps/ui/widgets/custom_text_field.dart';
import 'package:test_android_programming_apps/utils/validator.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  Widget build(context, SignUpController controller) {
    controller.view = this;

    Widget backgroundHeader() {
      return Container(
        height: 300,
        width: double.infinity,
        decoration: BoxDecoration(),
        child: Container(
          margin: EdgeInsets.only(top: 50),
          child: Column(
            children: [
              Text(
                'Test Android Programming',
                style: blackText.copyWith(
                  fontSize: 20,
                  fontWeight: semiBold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Image.asset(
                'assets/icon_logo.png',
                width: 150,
                height: 150,
              ),
            ],
          ),
        ),
      );
    }

    Widget inputSection() {
      bool validate() {
        if (controller.email.isEmpty) {
          showCustomSnackbar(context, 'Email can\'t empty');
          return false;
        }
        if (controller.password.isEmpty) {
          showCustomSnackbar(context, 'Password can\'t empty');
          return false;
        }
        if (controller.password.length > 8 || controller.password.length == 8) {
          return true;
        } else {
          showCustomSnackbar(
              context, 'Password can\'t be less than 8 characters');
          return false;
        }
      }

      return Container(
        margin: EdgeInsets.only(top: 20),
        child: ClipPath(
          clipper: WaveClipperTwo(reverse: true),
          child: Container(
            color: whiteColor,
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 60),
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Sign up to create\nyour account',
                        style: blackText.copyWith(
                          fontSize: 18,
                          fontWeight: semiBold,
                        ),
                      ),
                      SizedBox(height: 20),
                      CustomTextField(
                        label: 'Email Address',
                        value: controller.email,
                        validator: Validator.email,
                        onChanged: (value) {
                          controller.email = value;
                        },
                      ),
                      SizedBox(height: 16),
                      CustomTextField(
                        label: 'Password',
                        obscure: true,
                        validator: Validator.required,
                        value: controller.password,
                        onChanged: (value) {
                          controller.password = value;
                        },
                      ),
                      SizedBox(height: 20),
                      CustomButton(
                        text: 'Sign Up',
                        onPressed: () {
                          if (validate()) {
                            controller.signUpUser();
                          } else {
                            showInfoDialog('Field can\'t be empty!');
                          }
                        },
                      ),
                      SizedBox(height: 20),
                      CustomTextButton(
                        text: 'Sign in here!',
                        subText: 'Already have an account?',
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignIn(),
                            ),
                          );
                        },
                      ),
                      SizedBox(height: 25),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: lightBgColor,
      body: SafeArea(
        child: ListView(
          children: [
            backgroundHeader(),
            inputSection(),
          ],
        ),
      ),
    );
  }

  @override
  State<SignUp> createState() => SignUpController();
}

// class SignUpPage extends StatefulWidget {
//   const SignUpPage({super.key});

//   @override
//   State<SignUpPage> createState() => _SignUpPageState();
// }

// class _SignUpPageState extends State<SignUpPage> {
//   //Controller
//   final emailController = TextEditingController(text: '');
//   final passwordController = TextEditingController(text: '');

//   //Validate
//   bool validate() {
//     if (emailController.text.isEmpty || passwordController.text.isEmpty) {
//       return false;
//     } else {
//       return true;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     Widget backgroundHeader() {
//       return Container(
//         height: 300,
//         width: double.infinity,
//         decoration: BoxDecoration(),
//         child: Container(
//           margin: EdgeInsets.only(top: 50),
//           child: Column(
//             children: [
//               Text(
//                 'Test Android Programming',
//                 style: blackText.copyWith(
//                   fontSize: 20,
//                   fontWeight: semiBold,
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//               SizedBox(height: 20),
//               Image.asset(
//                 'assets/icon_logo.png',
//                 width: 150,
//                 height: 150,
//               ),
//             ],
//           ),
//         ),
//       );
//     }

//     Widget inputSection() {
//       return Container(
//         margin: EdgeInsets.only(top: 20),
//         child: ClipPath(
//           clipper: WaveClipperTwo(reverse: true),
//           child: Container(
//             color: whiteColor,
//             width: double.infinity,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Container(
//                   margin: EdgeInsets.only(top: 60),
//                   padding: EdgeInsets.symmetric(horizontal: 20),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         'Sign up to create\nyour account',
//                         style: blackText.copyWith(
//                           fontSize: 18,
//                           fontWeight: semiBold,
//                         ),
//                       ),
//                       SizedBox(height: 20),
//                       //Email input section
//                       CustomTextInput(
//                         text: 'Email Address',
//                         controller: emailController,
//                       ),
//                       SizedBox(height: 16),
//                       CustomTextInput(
//                         text: 'Password',
//                         secureText: true,
//                         controller: passwordController,
//                       ),
//                       SizedBox(height: 20),
//                       CustomButton(
//                         text: 'Sign Up',
//                         onPressed: () {
//                           if (validate()) {
//                           } else {
//                             showCustomSnackbar(
//                                 context, 'Email / password can\'t be empty');
//                           }
//                         },
//                       ),
//                       SizedBox(height: 20),
//                       CustomTextButton(
//                         text: 'Sign in here!',
//                         subText: 'Already have an account?',
//                         onPressed: () {
//                           Navigator.pushNamed(context, '/');
//                         },
//                       ),
//                       SizedBox(height: 25),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       );
//     }

//     return Scaffold(
//       backgroundColor: lightBgColor,
//       body: SafeArea(
//         child: ListView(
//           children: [
//             backgroundHeader(),
//             inputSection(),
//           ],
//         ),
//       ),
//     );
//   }
// }
