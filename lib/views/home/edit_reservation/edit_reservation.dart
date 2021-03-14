import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:texido_app/constants/app_constants.dart';
import 'package:texido_app/controllers/table.dart';
import 'package:texido_app/models/table.dart';
import '../reservation_info/reservation_bar.dart';
import '../reservation_info/reservation_body.dart';
import '../reservation_info/reservation_buttons.dart';

class EditReservation extends StatelessWidget {
  final TableInfo table;
  final int tableIndex;
  final bool forDialog;
  EditReservation({
    this.table,
    this.tableIndex,
    this.forDialog = false,
  });
  final controller = Get.find<TableController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      margin: EdgeInsets.only(top: size, right: size * 0.5),
      child: Container(
        color: forDialog ? Colors.transparent : blueGrey3,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ReservationBar("Edit Reservation", forDialog: forDialog),
              ReservationBody(
                table: table,
                tables: controller.tables,
                tableIndex: tableIndex,
              ),
              ReservationButtons(
                buttonLabel: "Save",
                forDialog: forDialog,
                tableIndex: tableIndex,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
