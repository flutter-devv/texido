import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:texido_app/constants/app_constants.dart';
import 'package:texido_app/models/table.dart';
import 'bottom_buttons.dart';
import 'build_item.dart';
import 'item_logo.dart';
import 'title_bar.dart';

class ReservationDetails extends StatelessWidget {
  final TableInfo item;
  final int index;
  ReservationDetails({
    this.item,
    this.index,
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
      item.member,
      item.name,
      "+966" + " " + item.mobile,
      item.date.value,
      item.time.value,
      item.guests,
      item.table,
      item.notes[0],
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
                ItemLogo(),
                ListView.builder(
                  itemCount: labels.length,
                  padding: EdgeInsets.symmetric(horizontal: size),
                  itemBuilder: (context, index) {
                    return BuildItem(
                      label: labels[index],
                      value: values[index],
                    );
                  },
                ),
              ],
            ),
          ),
          BottomButtons(),
        ],
      ),
    );
  }
}
