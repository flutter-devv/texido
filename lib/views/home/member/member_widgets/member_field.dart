import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:texido_app/constants/app_constants.dart';
import 'package:texido_app/constants/colors_constants.dart';
import 'package:texido_app/controllers/member.dart';
import 'package:texido_app/widgets/custom_field.dart';
import 'package:texido_app/widgets/custom_text.dart';

class MemberField extends StatelessWidget {
  final String label;
  final String hint;
  final Color hintColor;
  final bool readOnly;
  final GlobalKey<FormState> key;
  final TextEditingController fieldController;
  MemberField({
    this.label,
    this.hint,
    this.hintColor = AppColors.hintColor02,
    this.readOnly = false,
    this.key,
    this.fieldController,
  });
  final controller = Get.find<MemberController>();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RegularText(
          text: label,
          size: font1,
          color: darkGrey02,
        ),
        SizedBox(height: size * 0.5),
        Container(
          width: label != "Notes" ? size * 8.8 : Get.width,
          child: CustomField(
            vertical: label != "Notes" ? size * 0.8 : size * 1.5,
            hint: hint,
            filled: true,
            fieldController: fieldController,
            autoValidate: false,
            hintSize: font1,
            filledColor: greyColor03,
            borderColor: borderColor02,
            hintColor: hintColor,
            readOnly: readOnly,
            errorText: true,
            validate: (newValue) {
              if (fieldController.value.text.isEmpty) {
                return "";
              }
            },
          ),
        ),
      ],
    );
  }
}
