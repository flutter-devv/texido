import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:texido_app/constants/app_constants.dart';
import 'package:texido_app/controllers/member.dart';
import 'package:texido_app/widgets/custom_button.dart';

class BottomButtons extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  BottomButtons({this.formKey});
  final controller = Get.find<MemberController>();
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: controller.addMember.value == true
          ? ButtonBar(
              children: [
                CustomButton(
                  label: "Cancel",
                  labelColor: greenColor,
                  onPressed: () => controller.resetData(),
                  buttonColor: transparentColor,
                  labelSize: font2,
                ),
                CustomButton(
                  label: "+ Add Member",
                  onPressed: () {
                    controller.addMemberButton.value = true;
                    if (formKey.currentState.validate() &&
                        controller.genderSelected.value != "Gender" &&
                        controller.membershipSelected.value != "Membership") {
                      controller.addMemberToList();
                      controller.resetData();
                    }
                  },
                  buttonColor: greenColor,
                  height: size * 2.5,
                  labelSize: font2,
                ),
              ],
            )
          : Container(),
    );
  }
}
