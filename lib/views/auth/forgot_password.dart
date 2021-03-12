import 'package:flutter/material.dart';
import 'package:texido_app/constants/app_constants.dart';
import 'package:texido_app/widgets/custom_text.dart';
import 'app_logo.dart';
import 'auth_button.dart';
import 'go_back.dart';
import 'phone_field.dart';

class ForgotPassword extends StatelessWidget {
  final TextEditingController phoneController = TextEditingController();
  final GlobalKey _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        backgroundColor: whiteColor,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: size * 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: size * 2),
              AppLogo(),
              SizedBox(height: size * 4),
              MediumText(text: "Forgot Password", size: font6),
              SizedBox(height: size * 1.5),
              PhoneField(phoneController),
              SizedBox(height: size * 1.5),
              authButton(
                label: "SUBMIT",
                key: _formKey,
                phoneController: phoneController,
              ),
              SizedBox(height: size * 1.2),
              GoToLogin(),
            ],
          ),
        ),
      ),
    );
  }
}
