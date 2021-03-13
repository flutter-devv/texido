import 'package:flutter/material.dart';
import 'package:texido_app/constants/app_constants.dart';
import 'package:texido_app/widgets/custom_text.dart';

class ReservationItem extends StatelessWidget {
  final String label;
  final dynamic value;
  ReservationItem({
    this.label,
    this.value,
  });
  final List<String> months = [
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "May",
    "Jun",
    "Jul",
    "Aug",
    "Sept",
    "Oct",
    "Nov",
    "Dec"
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: size),
      child: Row(
        children: [
          Container(
            width: size * 3,
            child: RegularText(
              text: label,
              size: font1,
              color: blackColor04.withOpacity(0.5),
            ),
          ),
          SizedBox(width: size),
          SemiBoldText(
            text: label == "Table"
                ? "Table ${value.toString()}"
                : label == "Date"
                    ? "${value.day} ${months[value.month]} ${value.year}"
                    : value.toString(),
            color: greyColor06,
            size: font1,
          ),
        ],
      ),
    );
  }
}
