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
  final bool isFloor;
  EditReservation({
    this.table,
    this.isFloor,
  });
  final controller = Get.find<TableController>();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        alignment: Alignment.topCenter,
        margin: EdgeInsets.only(top: size, right: size * 0.5),
        child: Container(
          color: isFloor ? Colors.transparent : blueGrey3,
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ReservationBar("Edit Reservation"),
                ReservationBody(
                  table: TableInfo(
                    member: table.member,
                    name: table.name,
                    mobile: table.mobile,
                    time: table.time,
                    date: table.date,
                    guests: table.guests,
                    table: table.table,
                    activated: table.activated,
                    notes: table.notes,
                  ),
                ),
                ReservationButtons(
                  table: table,
                  isFloor: isFloor,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
