import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:texido_app/constants/app_constants.dart';
import 'package:texido_app/constants/asset_constants.dart';
import 'package:texido_app/controllers/table.dart';
import 'package:texido_app/models/table.dart';
import 'package:texido_app/widgets/custom_text.dart';

class ReservationTables extends StatelessWidget {
  final List<TableInfo> tables;
  ReservationTables(this.tables);
  final controller = Get.find<TableController>();
  @override
  Widget build(BuildContext context) {
    Color color;
    return Container(
      color: Color(0xffF4F4F5).withOpacity(0.4),
      padding: EdgeInsets.only(top: size, left: size * 0.5),
      child: ListView.builder(
        itemCount: tables.length,
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: size * 0.5),
        itemBuilder: (context, index) {
          if (tables[index].name.isEmpty)
            color = greenColor;
          else
            color = darkGrey03;
          return Padding(
            padding: EdgeInsets.only(bottom: size),
            child: Row(
              children: [
                Container(
                  height: size * 1.8,
                  width: size * 3.5,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(3.0),
                  ),
                  child: SemiBoldText(
                    text: "TA-${tables[index].table}",
                    size: font1,
                    color: color,
                  ),
                ),
                SizedBox(width: size * 0.5),
                MediumText(
                  text: tables[index].name.isEmpty ? "Available" : "Reserved",
                  size: font1,
                  color: color,
                ),
                Spacer(),
                Row(
                  children: [
                    SvgPicture.asset(
                      AppAssets.tap4,
                      height: size * 0.9,
                      color: color,
                    ),
                    SizedBox(width: size * 0.5),
                    MediumText(
                      text: tables[index].guests <= 2 ? "1-2" : "3-4",
                      size: font1,
                      color: color,
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
