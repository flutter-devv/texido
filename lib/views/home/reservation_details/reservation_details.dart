import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:texido_app/constants/app_constants.dart';
import 'package:texido_app/models/table.dart';
import 'bottom_buttons.dart';
import 'reservation_item.dart';
import 'reservation_logo.dart';
import 'title_bar.dart';

class ReservationDetails extends StatelessWidget {
  final TableInfo table;
  final int index;
  final bool forDialog;
  ReservationDetails({
    this.table,
    this.index,
    this.forDialog = false,
  });
  final List<String> labels = [
    "Member",
    "Name",
    "Mobile",
    "Date",
    "Time",
    "Guests",
    "Table",
    "Notes",
  ];
  @override
  Widget build(BuildContext context) {
    List values = [
      table.member,
      table.name,
      table.mobile,
      table.date.value,
      table.time.value,
      table.guests,
      table.table,
      table.notes[0],
    ];
    return Container(
      height: Get.height / 1.6,
      color: whiteColor,
      width: Get.width / 2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          TitleBar(),
          Expanded(
            child: Stack(
              children: [
                ReservationLogo(
                    guestsNumber: table.guests.value,
                    tableNumber: table.table,
                    tableActivated: table.activated),
                ListView.builder(
                  itemCount: labels.length,
                  padding: EdgeInsets.symmetric(horizontal: size),
                  itemBuilder: (context, index) {
                    return ReservationItem(
                      label: labels[index],
                      value: values[index],
                    );
                  },
                ),
              ],
            ),
          ),
          BottomButtons(
            table: table,
            tableIndex: index,
            forDialog: forDialog,
          ),
        ],
      ),
    );
  }
}
