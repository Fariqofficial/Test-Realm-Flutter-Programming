import 'package:flutter/material.dart';
import 'package:test_android_programming_apps/shared/themes.dart';
import 'package:test_android_programming_apps/utils/state_utils.dart';

showLoading({
  String? message,
}) async {
  await showDialog<void>(
    context: Get.currentContext,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 100,
            width: 150,
            child: Card(
              color: whiteColor,
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Align(
                  alignment: Alignment.center,
                  child: Wrap(
                    children: [
                      const SizedBox(
                        width: 12,
                        height: 12,
                        child: CircularProgressIndicator(),
                      ),
                      const SizedBox(
                        width: 12.0,
                      ),
                      Text(
                        message ?? "Please Wait...",
                        style: const TextStyle(
                          fontSize: 10.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      );
    },
  );
}

hideLoading() async {
  Get.back();
}
