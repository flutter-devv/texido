import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:texido_app/constants/app_constants.dart';
import 'package:texido_app/controllers/auth.dart';
import 'package:texido_app/widgets/custom_text.dart';

Widget authButton({
  String label,
  TextEditingController phoneController,
  TextEditingController passwordController,
  GlobalKey<FormState> key,
}) {
  final controller = Get.find<AuthController>();
  return Obx(
    () => FlatButton(
      onPressed: () {
        if (key.currentState.validate()) {
          if (label == "SIGN IN")
            controller.signIn(
              phone: phoneController.text,
              password: passwordController.text,
            );
          else
            controller.forgotPassword(phoneController.text);
        }
      },
      padding: EdgeInsets.all(0.0),
      child: Container(
        height: size * 3.1,
        width: Get.width,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: controller.success.value ? greenColor : redColor,
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: (controller.loading.value == false &&
                controller.success.value == false &&
                controller.failed.value == false)
            ? SemiBoldText(text: label, size: font5, color: whiteColor)
            : (controller.loading.value)
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SemiBoldText(
                          text: "Loading", size: font5, color: whiteColor),
                      SpinKitThreeBounce(
                        color: whiteColor,
                        size: size * 2,
                      ),
                    ],
                  )
                : (controller.success.value)
                    ? SemiBoldText(
                        text: "Succeed", size: font5, color: whiteColor)
                    : SemiBoldText(
                        text: "Failed", size: font5, color: whiteColor),
      ),
    ),
  );
}
