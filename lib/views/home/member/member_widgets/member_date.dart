import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:texido_app/config/picker.dart';
import 'package:texido_app/constants/app_constants.dart';
import 'package:texido_app/constants/asset_constants.dart';
import 'package:texido_app/constants/colors_constants.dart';
import 'package:texido_app/controllers/member.dart';
import 'package:texido_app/widgets/custom_text.dart';
import 'package:texido_app/config/months.dart';

class MemberDate extends StatelessWidget {
  final DateTime date;
  MemberDate({this.date});
  final controller = Get.find<MemberController>();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RegularText(
          text: "DBO",
          size: font1,
          color: darkGrey02,
        ),
        SizedBox(height: size * 0.5),
        GestureDetector(
          onTap: date == null
              ? () async {
                  controller.selectedDate.value =
                      await Picker().selectDate(context);
                }
              : null,
          child: Container(
            width: size * 8.8,
            height: size * 2.5,
            padding: EdgeInsets.only(
                left: size,
                right: size * 0.5,
                top: size * 0.5,
                bottom: size * 0.5),
            decoration: BoxDecoration(
              color: greyColor03,
              border: Border.all(color: borderColor02),
              borderRadius: BorderRadius.circular(3.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                date == null
                    ? Obx(
                        () => Text(
                          '${controller.selectedDate.value.day}'
                          ' ${months[controller.selectedDate.value.month]}'
                          ' ${controller.selectedDate.value.year}',
                          style: TextStyle(fontSize: font2),
                        ),
                      )
                    : Text(
                        '${date.day}'
                        ' ${months[date.month]}'
                        ' ${date.year}',
                        style: TextStyle(
                            fontSize: font2, color: AppColors.darkGrey03),
                      ),
                SvgPicture.asset(
                  AppAssets.calendar,
                  color: darkGrey03,
                  height: size,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
