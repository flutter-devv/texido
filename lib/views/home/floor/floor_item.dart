import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:texido_app/constants/app_constants.dart';
import 'package:texido_app/models/table.dart';
import 'package:texido_app/widgets/custom_text.dart';

class FloorItem extends StatelessWidget {
  final TableInfo item;
  final int index;
  FloorItem({
    this.item,
    this.index,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: () => Get.defaultDialog(
          title: "",
          content: ItemDetails(item, index),
          radius: 0.0,
          backgroundColor: Colors.transparent,
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            SvgPicture.asset(
              item.guests > 2 ? doubleTable : item,
              height: item.guests > 2 ? size * 4 : size * 2.5,
              color: item.activated ? greenColor : blueGrey4,
            ),
            RegularText(
              text: item.table.toString(),
              size: font3,
              color: whiteColor,
            ),
          ],
        ),
      ),
    );
  }
}
