import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:texido_app/config/routes.dart';
import 'package:texido_app/constants/app_constants.dart';
import 'package:texido_app/widgets/custom_text.dart';

class GoToLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        MediumText(
          text: "Back To ",
          size: font4,
        ),
        GestureDetector(
          child: MediumText(
            text: "login",
            size: font4,
            color: redColor,
          ),
          onTap: () => Get.offAndToNamed(Routes.signIn),
        )
      ],
    );
  }
}
