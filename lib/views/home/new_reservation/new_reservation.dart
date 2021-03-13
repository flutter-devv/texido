import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:texido_app/constants/app_constants.dart';
import 'package:texido_app/controllers/table.dart';
import 'package:texido_app/models/table.dart';
import 'package:texido_app/views/home/reservation_info/reservation_bar.dart';
import 'package:texido_app/views/home/reservation_info/reservation_body.dart';
import 'package:texido_app/views/home/reservation_info/reservation_buttons.dart';

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
                    time: "".obs,
                    date: DateTime(0, 0).obs,
                    guests: 00.obs,
                    table: 0,
                    activated: true,
                    notes: [""],
                  ),
                ),
                ReservationButtons(
                  table: controller.tables[0],
                  buttonLabel: "Reserve",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
