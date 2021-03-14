import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:texido_app/constants/app_constants.dart';
import 'package:texido_app/controllers/table.dart';
import 'package:texido_app/models/table.dart';
import '../reservation_info/reservation_bar.dart';
import '../reservation_info/reservation_body.dart';
import '../reservation_info/reservation_buttons.dart';

class NewReservation extends StatelessWidget {
  final controller = Get.find<TableController>();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        alignment: Alignment.topCenter,
        margin: EdgeInsets.only(top: size, right: size * 0.5),
        child: Container(
          color: blueGrey3,
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ReservationBar("New Reservation"),
                ReservationBody(
                  table: TableInfo(
                    member: "",
                    name: "",
                    mobile: "",
                    time: "",
                    date: DateTime.now(),
                    guests: 00,
                    table: 0,
                    activated: true,
                    notes: "",
                  ),
                  tables: controller.activatedTables,
                  tableIndex: controller.activatedTables[0].table,
                ),
                ReservationButtons(
                  buttonLabel: "Reserve",
                  tableIndex: controller.activatedTables[0].table,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
