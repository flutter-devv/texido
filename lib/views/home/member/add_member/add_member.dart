import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:texido_app/constants/app_constants.dart';
import 'package:texido_app/controllers/member.dart';
import 'package:texido_app/widgets/custom_text.dart';

import 'bottom_buttons.dart';
import 'user_date.dart';
import 'user_dropdown.dart';
import 'user_field.dart';
import 'user_image.dart';

class AddMember extends StatelessWidget {
  final controller = Get.find<MemberController>();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        color: whiteColor,
        padding: EdgeInsets.symmetric(horizontal: size),
        margin: EdgeInsets.only(top: size, right: size * 0.5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: size),
            SemiBoldText(
              text: "Personal Details",
              size: font1,
              color: darkGrey01,
            ),
            SizedBox(height: size),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  UserImage(),
                  SizedBox(width: size * 1.5),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              UserField(
                                label: "First Name",
                                hint: "Enter first name",
                                fieldController: controller.firstNameController,
                              ),
                              SizedBox(width: size * 0.5),
                              UserField(
                                label: "Last Name",
                                hint: "Enter last name",
                                fieldController: controller.lastNameController,
                              ),
                              SizedBox(width: size * 0.5),
                              UserField(
                                label: "Phone",
                                hint: "Enter your phone",
                                fieldController: controller.phoneController,
                              ),
                            ],
                          ),
                          SizedBox(height: size * 1.3),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              UserDropdown(
                                data: controller.membership,
                                value: controller.membershipSelected.value,
                                label: "Membership",
                              ),
                              SizedBox(width: size * 0.5),
                              UserDropdown(
                                data: controller.gender,
                                value: controller.genderSelected.value,
                                label: "Gender",
                              ),
                              SizedBox(width: size * 0.5),
                              UserField(
                                label: "Email",
                                hint: "Enter email address",
                                fieldController: controller.emailController,
                              ),
                            ],
                          ),
                          SizedBox(height: size * 1.3),
                          UserData(),
                          SizedBox(height: size * 1.3),
                          UserField(
                            label: "Notes",
                            hint: "Leave your notes",
                            fieldController: controller.noteController,
                          ),
                          SizedBox(height: size),
                          Divider(color: greyColor01.withOpacity(0.5)),
                          BottomButtons(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
