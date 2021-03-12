import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:texido_app/constants/app_constants.dart';
import 'package:texido_app/controllers/table.dart';
import 'package:texido_app/widgets/custom_text.dart';

class ReservationBar extends StatelessWidget {
  final String title;
  final bool isFloor;
  ReservationBar(this.title, {this.isFloor = false});
  final controller = Get.find<TableController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: size * 2.2,
      padding: EdgeInsets.symmetric(horizontal: size),
      decoration: BoxDecoration(
        color: Color(0xffF4F4F5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          MediumText(
            text: title,
            color: greyColor06,
            size: font3,
          ),
          GestureDetector(
              child: Icon(
                Icons.close,
                size: size * 1.5,
                color: Color(0xffFF4C4D),
              ),
              onTap: () {
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
