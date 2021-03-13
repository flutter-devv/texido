import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:texido_app/constants/app_constants.dart';
import 'package:texido_app/controllers/table.dart';
import 'package:texido_app/models/table.dart';
import 'package:texido_app/widgets/custom_button.dart';

class ReservationButtons extends StatelessWidget {
  final TableInfo table;
  final String buttonLabel;
  final int tableIndex;
  final bool forDialog;
  ReservationButtons({
    this.table,
    this.buttonLabel,
    this.tableIndex,
    this.forDialog = false,
  });
  final controller = Get.find<TableController>();
  @override
  Widget build(BuildContext context) {
    // print("tableee: ${table.guests}");
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
              if (forDialog)
                Get.close(1);
              else
                controller.edit.value = false;
            },
            hasBorder: true,
          ),
          SizedBox(width: size * 0.5),
          CustomButton(
              label: buttonLabel,
              labelColor: whiteColor,
              buttonColor: greenColor,
              labelSize: font2,
              onPressed: () {
                controller.tables[tableIndex] = TableInfo(
                  member: controller.tables[tableIndex].member,
                  name: controller.nameController.text,
                  mobile: controller.mobileController.text,
                  date: controller.tables[tableIndex].date,
                  time: controller.tables[tableIndex].time,
                  guests: controller.tables[tableIndex].guests,
                  notes: [controller.noteController.text],
                );
                // controller.tables[tableIndex] = TableInfo(
                //   member: "Golden membership",
                //   name: table.name,
                //   mobile: table.mobile.substring(4),
                //   date: table.date,
                //   time: table.time,
                //   guests: table.guests,
                //   table: table.table,
                //   notes: ["Birthday party"],
                //   activated: table.activated,
                // );
                if (forDialog)
                  Get.close(1);
                else
                  controller.edit.value = false;
              }),
        ],
      ),
    );
  }
}
