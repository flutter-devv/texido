import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:texido_app/constants/app_constants.dart';
import 'package:texido_app/controllers/table.dart';
import 'package:texido_app/widgets/custom_text.dart';

class TitleBar extends StatelessWidget {
  final bool forDialog;
  TitleBar(this.forDialog);
  final controller = Get.find<TableController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: size),
      color: Color(0xffF4F4F5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          MediumText(
            text: "Reservation details",
            size: font3,
          ),
          IconButton(
            icon: Icon(
              Icons.close,
              color: Color(0xffFF4C4D),
            ),
            onPressed: () {
              if (forDialog)
                Get.close(1);
              else {
                controller.closeDetails.value = true;
              }
            },
          )
        ],
      ),
    );
  }
}
