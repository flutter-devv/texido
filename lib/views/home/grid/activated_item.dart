import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:texido_app/constants/app_constants.dart';
import 'package:texido_app/constants/asset_constants.dart';
import 'package:texido_app/controllers/table.dart';
import 'package:texido_app/models/table.dart';
import 'package:texido_app/views/home/reservation_details/reservation_details.dart';
import 'package:texido_app/widgets/custom_text.dart';

class ActivatedItem extends StatelessWidget {
  final TableInfo table;
  final int tableIndex;
  ActivatedItem(this.table, this.tableIndex);
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SizedBox(
        height: size * 9,
        child: GestureDetector(
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
                            AppAssets.tap4,
                            height: size,
                            color: darkGrey04,
                          ),
                          SizedBox(width: size * 0.5),
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
      ),
    );
  }
}
