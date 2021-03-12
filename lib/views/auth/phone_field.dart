import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:texido_app/constants/app_constants.dart';
import 'package:texido_app/controllers/auth.dart';
import 'package:texido_app/widgets/custom_field.dart';
import 'package:texido_app/widgets/custom_text.dart';

class PhoneField extends StatelessWidget {
  final TextEditingController phoneController;
  PhoneField(this.phoneController);
  final controller = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MediumText(text: "Mobile number", size: font3),
        SizedBox(height: size * 0.5),
        CustomField(
          hint: "Enter your number",
          vertical: size,
          fieldController: phoneController,
          prefix: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: size * 1.1),
              Text(
                "+966",
                style: TextStyle(
                  color: redColor,
                  fontSize: size * 1.1,
                ),
              ),
              SizedBox(width: size),
            ],
          ),
          validate: (newValue) {
            if (newValue.isEmpty) return "Please enter your number";
            if (newValue.length < 9) return "Invalid phone number";
          },
          onSubmit: (newValue) {
            controller.phoneValidate.value = true;
          },
          autoValidate: controller.phoneValidate.value,
        ),
      ],
    );
  }
}
