import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:texido_app/config/picker.dart';
import 'package:texido_app/constants/app_constants.dart';
import 'package:texido_app/constants/asset_constants.dart';
import 'package:texido_app/controllers/member.dart';
import 'package:texido_app/widgets/custom_text.dart';

class UserData extends StatelessWidget {
  final controller = Get.find<MemberController>();
  final List<String> months = [
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "May",
    "Jun",
    "Jul",
    "Aug",
    "Sept",
    "Oct",
    "Nov",
    "Dec"
  ];
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
        Obx(
          () => GestureDetector(
            onTap: () async {
              controller.selectedDate.value =
                  await Picker().selectDate(context);
            },
            child: Container(
              width: size * 8.5,
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  controller.selectedDate.value != DateTime(0, 0, 0)
                      ? Text(
                          '${controller.selectedDate.value.day}'
                          ' ${months[controller.selectedDate.value.month]}'
                          ' ${controller.selectedDate.value.year}',
                          style: TextStyle(fontSize: font2),
                        )
                      : Text(
                          "Select DOB",
                          style: TextStyle(
                              color: hintColor02.withOpacity(0.5),
                              fontSize: font2),
                        ),
                  SvgPicture.asset(
                    calendar,
                    color: darkGrey03,
                    height: size,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
