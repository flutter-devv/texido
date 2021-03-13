import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:texido_app/constants/app_constants.dart';
import 'package:texido_app/constants/colors_constants.dart';
import 'package:texido_app/controllers/member.dart';
import 'package:texido_app/widgets/custom_text.dart';

class MemberDropdown extends StatelessWidget {
  final List<String> data;
  final String value;
  final String label;
  final bool enabled;
  MemberDropdown({
    this.data,
    this.value,
    this.label,
    this.enabled = true,
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
        Obx(
          () => Container(
            width: size * 9.5,
            height: size * 2.5,
            padding: EdgeInsets.only(
                left: size,
                right: size * 0.5,
                top: size * 0.5,
                bottom: size * 0.5),
            decoration: BoxDecoration(
              color: greyColor03,
              border: Border.all(
                  color: controller.addMemberButton.value
                      ? (controller.membershipSelected.value == "Membership" ||
                              controller.genderSelected.value == "Gender"
                          ? redColor.withOpacity(0.4)
                          : borderColor02)
                      : borderColor02),
              borderRadius: BorderRadius.circular(3.0),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton(
                icon: Icon(
                  Icons.keyboard_arrow_down_outlined,
                  color: darkGrey03,
                  size: size * 1.1,
                ),
                isExpanded: true,
                isDense: true,
                items: data
                    .map<DropdownMenuItem<String>>(
                      (item) => DropdownMenuItem(
                          child: Text(
                            item,
                            style: TextStyle(
                                color: (controller.membershipSelected.value ==
                                            "Membership" ||
                                        controller.genderSelected.value ==
                                            "Gender")
                                    ? greyColor01.withOpacity(0.5)
                                    : AppColors.darkGrey03,
                                fontSize: font2),
                          ),
                          value: item),
                    )
                    .toList(),
                onChanged: enabled
                    ? (newValue) {
                        if (value == controller.membershipSelected.value)
                          controller.membershipSelected.value = newValue;
                        else
                          controller.genderSelected.value = newValue;
                      }
                    : null,
                value: value,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
