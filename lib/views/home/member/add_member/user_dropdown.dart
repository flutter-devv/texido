import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:texido_app/constants/app_constants.dart';
import 'package:texido_app/controllers/member.dart';
import 'package:texido_app/widgets/custom_text.dart';

class UserDropdown extends StatelessWidget {
  final List<String> data;
  final String value;
  final String label;
  UserDropdown({
    this.data,
    this.value,
    this.label,
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
          width: size * 8.5,
          height: size * 2.2,
          padding: EdgeInsets.only(
              left: size,
              right: size * 0.5,
              top: size * 0.5,
              bottom: size * 0.5),
          decoration: BoxDecoration(
            color: greyColor03,
            border: Border.all(color: borderColor02),
            borderRadius: BorderRadius.circular(6.0),
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
                              color:
                                  (value == "Membership" || value == "Gender")
                                      ? greyColor01.withOpacity(0.5)
                                      : blackColor,
                              fontSize: font2),
                        ),
                        value: item),
                  )
                  .toList(),
              onChanged: (newValue) {
                if (value == controller.membershipSelected.value)
                  controller.membershipSelected.value = newValue;
                else
                  controller.genderSelected.value = newValue;
              },
              value: value,
            ),
          ),
        ),
      ],
    );
  }
}
