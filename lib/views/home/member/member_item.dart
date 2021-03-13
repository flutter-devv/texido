import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:texido_app/constants/app_constants.dart';
import 'package:texido_app/constants/asset_constants.dart';
import 'package:texido_app/controllers/member.dart';
import 'package:texido_app/models/member.dart';
import 'package:texido_app/widgets/custom_text.dart';

class MemberItem extends StatelessWidget {
  final MemberInfo member;
  final int memberIndex;
  MemberItem(this.member, this.memberIndex);
  final controller = Get.find<MemberController>();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: controller.addMember.value
          ? null
          : () {
              controller.viewMember.value = true;
              controller.memberIndex.value = memberIndex;
            },
      child: Container(
        height: size * 5,
        padding: EdgeInsets.symmetric(horizontal: size * 0.5),
        margin: EdgeInsets.only(bottom: size),
        decoration: BoxDecoration(
          color: controller.memberIndex.value.isEqual(memberIndex)
              ? blueGrey5
              : whiteColor,
          borderRadius: BorderRadius.circular(3.0),
        ),
        child: Row(
          children: [
            Row(
              children: [
                member.image.isNotEmpty
                    ? CircleAvatar(
                        backgroundImage: FileImage(File(member.image)),
                        radius: size * 1.2,
                      )
                    : CircleAvatar(
                        backgroundColor: greyColor01.withOpacity(0.3),
                        radius: size * 1.2,
                        child: Icon(
                          Icons.person_outline,
                          color: greyColor02,
                          size: size,
                        ),
                      ),
              ],
            ),
            SizedBox(width: size),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RegularText(
                    text: '${member.firstName} ${member.lastName}',
                    size: font2,
                    color: darkGrey01,
                  ),
                  SizedBox(height: size * 0.5),
                  Row(
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(AppAssets.mobile,
                              color: darkGrey01, height: size),
                          SizedBox(width: size * 0.5),
                          RegularText(
                            text: member.phone,
                            size: font2,
                            color: darkGrey01,
                          ),
                        ],
                      ),
                      SizedBox(width: size * 2),
                      Row(
                        children: [
                          SvgPicture.asset(AppAssets.prize, color: darkGrey01),
                          SizedBox(width: size * 0.5),
                          RegularText(
                            text: member.membership,
                            size: font2,
                            color: darkGrey01,
                          ),
                        ],
                      ),
                    ],
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
