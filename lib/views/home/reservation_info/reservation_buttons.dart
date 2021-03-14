import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:texido_app/constants/app_constants.dart';
import 'package:texido_app/controllers/reservation.dart';
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
  final controller1 = Get.find<TableController>();
  final controller2 = Get.find<ReservationController>();
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
              if (forDialog)
                Get.close(1);
              else {
                controller1.edit.value = false;
                controller1.newReservation.value = false;
              }
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
                controller2.updateReservation(tableIndex);
                if (forDialog)
                  Get.close(1);
                else {
                  controller1.edit.value = false;
                  controller1.newReservation.value = false;
                }
              }),
        ],
      ),
    );
  }
}
