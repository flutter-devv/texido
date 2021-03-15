import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:texido_app/constants/app_constants.dart';
import 'package:texido_app/constants/asset_constants.dart';
import 'package:texido_app/models/table.dart';
import 'package:texido_app/views/home/reservation_details/reservation_details.dart';
import 'package:texido_app/widgets/custom_text.dart';

class AvailableItem extends StatelessWidget {
  final TableInfo table;
  final int tableIndex;
  AvailableItem(this.table, this.tableIndex);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.defaultDialog(
        title: "",
        content: ReservationDetails(
          table: table,
          index: tableIndex,
          forDialog: true,
        ),
        radius: 0.0,
        backgroundColor: Colors.transparent,
      ),
      child: SizedBox(
        height: size * 9,
        child: Card(
          elevation: 0.0,
          color: whiteColor,
          margin: EdgeInsets.only(bottom: size, left: size),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: size, vertical: size),
            child: Row(
              children: [
                Container(
                  height: size * 2.5,
                  width: size * 4,
                  decoration: BoxDecoration(
                    color: greyColor02.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(3.0),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SemiBoldText(
                        text: "TA-${table.table}",
                        color: darkGrey03,
                        size: font1,
                      ),
                    ],
                  ),
                ),
                SizedBox(width: size),
                Row(
                  children: [
                    MediumText(
                      text: "Main room",
                      size: font1,
                      color: darkGrey04,
                    ),
                    SizedBox(width: size),
                    Row(
                      children: [
                        SvgPicture.asset(
                          AppAssets.tap4,
                          height: size * 0.8,
                          color: darkGrey04,
                        ),
                        SizedBox(width: size * 0.5),
                        MediumText(
                          text: table.guests <= 2 ? "1-2" : "3-4",
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
