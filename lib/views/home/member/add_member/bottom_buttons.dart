import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:texido_app/constants/app_constants.dart';
import 'package:texido_app/controllers/member.dart';
import 'package:texido_app/widgets/custom_button.dart';

class BottomButtons extends StatelessWidget {
  final controller = Get.find<MemberController>();
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: ButtonBar(
        children: [
          CustomButton(
            label: "Cancel",
            labelColor: greenColor,
            onPressed: () {
              controller.addMember.value = false;
              controller.selectedDate.value = DateTime(2030, 1, 1);
              controller.imagePath.value = "";
              controller.clearControllers();
            },
            buttonColor: transparentColor,
            labelSize: font2,
          ),
          CustomButton(
            label: "+ Add Member",
            onPressed: () {
              controller.addMemberToList();
              controller.clearControllers();
            },
            buttonColor: greenColor,
            height: size * 2.5,
            labelSize: font2,
          ),
        ],
      ),
    );
  }
}
