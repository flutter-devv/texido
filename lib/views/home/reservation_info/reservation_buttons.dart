import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:texido_app/constants/app_constants.dart';
import 'package:texido_app/controllers/table.dart';
import 'package:texido_app/models/table.dart';
import 'package:texido_app/widgets/custom_button.dart';

class ReservationButtons extends StatelessWidget {
  final TableInfo table;
  final String name;
  final String mobile;
  final bool isFloor;
  ReservationButtons({
    this.table,
    this.name,
    this.mobile,
    this.isFloor,
  });
  final controller = Get.find<TableController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: size * 3.2,
      decoration: BoxDecoration(color: Color(0xffF4F4F5)),
      child: ButtonBar(
        children: [
          CustomButton(
            label: "Cancel",
            labelColor: darkGrey03,
            buttonColor: transparentColor,
            borderColor: darkGrey03,
            labelSize: font2,
            onPressed: () {
              if (isFloor)
                Get.close(1);
              else
                controller.edit.value = false;
            },
            hasBorder: true,
          ),
          SizedBox(width: size * 0.5),
          CustomButton(
              label: "Save",
              labelColor: whiteColor,
              buttonColor: greenColor,
              labelSize: font2,
              onPressed: () {
                controller.tables[controller.index.value] = TableInfo(
                  member: "Golden membership",
                  name: name,
                  mobile: mobile.substring(4),
                  date: table.date,
                  time: table.time,
                  guests: table.guests,
                  table: table.table,
                  notes: ["Birthday party"],
                  activated: table.activated,
                );
                if (isFloor)
                  Get.close(1);
                else
                  controller.edit.value = false;
              }),
        ],
      ),
    );
  }
}
