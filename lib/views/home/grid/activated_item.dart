import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:texido_app/constants/app_constants.dart';
import 'package:texido_app/constants/asset_constants.dart';
import 'package:texido_app/models/table.dart';
import 'package:texido_app/widgets/custom_text.dart';

class ActivatedItem extends StatelessWidget {
  final TableInfo table;
  ActivatedItem(this.table);
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SizedBox(
        height: size * 9,
        child: Card(
          elevation: 0.0,
          color: blueGrey2.withOpacity(0.1),
          margin: EdgeInsets.only(bottom: size, left: size),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: size, vertical: size),
            child: Row(
              children: [
                Container(
                  height: size * 3,
                  width: size * 3,
                  decoration: BoxDecoration(
                    color: blueGrey2.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(3.0),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SemiBoldText(
                        text: table.time.value,
                        color: darkGrey03,
                        size: font1,
                      ),
                      SemiBoldText(
                        text: "pm",
                        color: darkGrey03,
                        size: size * 0.4,
                      ),
                    ],
                  ),
                ),
                SizedBox(width: size * 2),
                Divider(color: blackColor02.withOpacity(0.05), thickness: 2),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RegularText(
                      text: table.name,
                      size: font3,
                      color: darkGrey04,
                    ),
                    SizedBox(height: size * 0.5),
                    MediumText(
                      text: table.mobile,
                      size: font1,
                      color: darkGrey04,
                    ),
                    SizedBox(height: size * 0.5),
                    MediumText(
                      text: table.member,
                      size: font1,
                      color: darkGrey04,
                    ),
                    SizedBox(height: size * 0.5),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SvgPicture.asset(
                          tap4,
                          height: size,
                          color: darkGrey04,
                        ),
                        MediumText(
                          text: table.guests.value <= 2 ? "1-2" : "3-4",
                          size: font1,
                          color: darkGrey04,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
