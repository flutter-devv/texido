import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:texido_app/constants/app_constants.dart';
import 'package:texido_app/widgets/custom_text.dart';

class ConfirmButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size * 20),
      child: FlatButton(
        onPressed: () => Get.close(1),
        padding: EdgeInsets.all(0.0),
        child: Container(
          height: size * 3.5,
          width: Get.width,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: greenColor,
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: SemiBoldText(
            text: "Confirm",
            size: font5,
            color: whiteColor,
          ),
        ),
      ),
    );
  }
}
