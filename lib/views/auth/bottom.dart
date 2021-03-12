import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:texido_app/config/routes.dart';
import 'package:texido_app/constants/app_constants.dart';
import 'package:texido_app/controllers/auth.dart';
import 'package:texido_app/widgets/custom_text.dart';

class Bottom extends StatelessWidget {
  final controller = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Theme(
          data: ThemeData(
            unselectedWidgetColor: redColor,
          ),
          child: Row(
            children: [
              Obx(
                () => Checkbox(
                  value: controller.radio.value,
                  activeColor: redColor,
                  onChanged: (bool newVal) {
                    controller.radio.value = newVal;
                  },
                ),
              ),
              RegularText(
                text: "Remember me",
                size: font3,
                color: redColor,
              ),
            ],
          ),
        ),
        FlatButton(
          onPressed: () => Get.toNamed(Routes.forgotPassword),
          child: SemiBoldText(
            text: "Forgot password?",
            size: font3,
            color: redColor,
          ),
        ),
      ],
    );
  }
}
