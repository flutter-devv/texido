import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:texido_app/constants/app_constants.dart';
import 'package:texido_app/controllers/auth.dart';
import 'package:texido_app/widgets/custom_field.dart';
import 'package:texido_app/widgets/custom_text.dart';

class PasswordField extends StatelessWidget {
  final TextEditingController passwordController;
  PasswordField(this.passwordController);
  final controller = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MediumText(text: "Password", size: font3),
        SizedBox(height: size * 0.5),
        CustomField(
          hint: "Enter your password",
          vertical: size,
          fieldController: passwordController,
          suffix: IconButton(
            icon: Icon(
              controller.passVisible.value
                  ? Icons.visibility_outlined
                  : Icons.visibility_off_outlined,
              color: hintColor01,
              size: size * 1.5,
            ),
            onPressed: () {
              controller.passVisible.value = !controller.passVisible.value;
            },
          ),
          obscureText: controller.passVisible.value ? false : true,
          validate: (newValue) {
            if (newValue.isEmpty)
              return "Please enter your password";
            else if (newValue.length < 5) return "Too short password";
          },
          onSubmit: (newValue) {
            controller.passwordValidate.value = true;
          },
          autoValidate: controller.passwordValidate.value,
        ),
      ],
    );
  }
}
