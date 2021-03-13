import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:texido_app/constants/app_constants.dart';
import 'package:texido_app/controllers/member.dart';
import 'package:texido_app/widgets/custom_text.dart';
import '../member_widgets/bottom_buttons.dart';
import '../member_widgets/member_date.dart';
import '../member_widgets/member_dropdown.dart';
import '../member_widgets/member_field.dart';
import '../member_widgets/member_image.dart';

class AddMember extends StatelessWidget {
  final controller = Get.find<MemberController>();
  final GlobalKey _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Form(
        key: _formKey,
        child: Container(
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
                    MemberImage(),
                    SizedBox(width: size * 1.5),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                MemberField(
                                  label: "First Name",
                                  hint: "Enter first name",
                                  fieldController:
                                      controller.firstNameController,
                                ),
                                SizedBox(width: size * 0.5),
                                MemberField(
                                  label: "Last Name",
                                  hint: "Enter last name",
                                  fieldController:
                                      controller.lastNameController,
                                ),
                                SizedBox(width: size * 0.5),
                                MemberField(
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
                                MemberDropdown(
                                  data: controller.membership,
                                  value: controller.membershipSelected.value,
                                  label: "Membership",
                                ),
                                SizedBox(width: size * 0.5),
                                MemberDropdown(
                                  data: controller.gender,
                                  value: controller.genderSelected.value,
                                  label: "Gender",
                                ),
                                SizedBox(width: size * 0.5),
                                MemberField(
                                  label: "Email",
                                  hint: "Enter email address",
                                  fieldController: controller.emailController,
                                ),
                              ],
                            ),
                            SizedBox(height: size * 1.3),
                            MemberDate(),
                            SizedBox(height: size * 1.3),
                            MemberField(
                              label: "Notes",
                              hint: "Leave your notes",
                              fieldController: controller.noteController,
                            ),
                            SizedBox(height: size),
                            Divider(color: greyColor01.withOpacity(0.5)),
                            BottomButtons(formKey: _formKey),
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
      ),
    );
  }
}
