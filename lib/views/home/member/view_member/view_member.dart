import 'package:flutter/material.dart';
import 'package:texido_app/constants/app_constants.dart';
import 'package:texido_app/constants/colors_constants.dart';
import 'package:texido_app/constants/sizes_constants.dart';
import 'package:texido_app/models/member.dart';
import '../member_widgets/bottom_buttons.dart';
import '../member_widgets/member_date.dart';
import '../member_widgets/member_field.dart';
import '../member_widgets/member_image.dart';
import 'package:texido_app/widgets/custom_text.dart';

class ViewMember extends StatelessWidget {
  final MemberInfo member;
  ViewMember(this.member);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.whiteColor,
      padding: EdgeInsets.symmetric(horizontal: AppSize.size),
      margin: EdgeInsets.only(top: AppSize.size, right: AppSize.size * 0.5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: AppSize.size),
          SemiBoldText(
            text: "Personal Details",
            size: font1,
            color: AppColors.darkGrey01,
          ),
          SizedBox(height: AppSize.size),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MemberImage(memberImage: member.image),
                SizedBox(width: AppSize.size * 1.5),
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
                              readOnly: true,
                              hintColor: AppColors.darkGrey03,
                              fieldController:
                                  TextEditingController(text: member.firstName),
                            ),
                            SizedBox(width: AppSize.size * 0.5),
                            MemberField(
                              label: "Last Name",
                              hint: "Enter last name",
                              readOnly: true,
                              hintColor: AppColors.darkGrey03,
                              fieldController:
                                  TextEditingController(text: member.lastName),
                            ),
                            SizedBox(width: AppSize.size * 0.5),
                            MemberField(
                              label: "Phone",
                              hint: "Enter your phone",
                              readOnly: true,
                              hintColor: AppColors.darkGrey03,
                              fieldController:
                                  TextEditingController(text: member.phone),
                            ),
                          ],
                        ),
                        SizedBox(height: AppSize.size * 1.3),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            MemberField(
                              label: "Membership",
                              readOnly: true,
                              hintColor: AppColors.darkGrey03,
                              fieldController: TextEditingController(
                                  text: member.membership),
                            ),
                            SizedBox(width: AppSize.size * 0.5),
                            MemberField(
                              label: "member",
                              readOnly: true,
                              hintColor: AppColors.darkGrey03,
                              fieldController:
                                  TextEditingController(text: member.gender),
                            ),
                            SizedBox(width: AppSize.size * 0.5),
                            MemberField(
                              label: "Email",
                              hint: "Enter email address",
                              readOnly: true,
                              hintColor: AppColors.darkGrey03,
                              fieldController:
                                  TextEditingController(text: member.email),
                            ),
                          ],
                        ),
                        SizedBox(height: AppSize.size * 1.3),
                        MemberDate(date: member.date),
                        SizedBox(height: AppSize.size * 1.3),
                        MemberField(
                          label: "Notes",
                          hint: "Leave your notes",
                          readOnly: true,
                          hintColor: AppColors.darkGrey03,
                          fieldController:
                              TextEditingController(text: member.notes),
                        ),
                        SizedBox(height: AppSize.size),
                        Divider(color: AppColors.greyColor01.withOpacity(0.5)),
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
    );
  }
}
