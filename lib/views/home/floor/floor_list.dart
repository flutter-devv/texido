import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:texido_app/constants/app_constants.dart';
import 'package:texido_app/controllers/table.dart';
import 'floor_item.dart';

class FloorList extends StatelessWidget {
  final controller = Get.find<TableController>();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GridView.count(
        crossAxisCount: 10,
        childAspectRatio: 0.9,
        mainAxisSpacing: size,
        crossAxisSpacing: size,
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.only(left: size, right: size * 6),
        children: List.generate(
          controller.tables.length,
          (index) {
            return FloorItem(
              item: controller.tables[index],
              index: index,
            );
          },
        ),
      ),
    );
  }
}
