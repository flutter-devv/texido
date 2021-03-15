import 'package:flutter/material.dart';
import 'package:texido_app/models/table.dart';
import 'unavailable_item.dart';
import 'available_item.dart';
import 'package:get/get.dart';

class GridList extends StatelessWidget {
  final List<TableInfo> items;
  GridList(this.items);
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ListView.builder(
        itemCount: items.length,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          if (items[index].available == true)
            return AvailableItem(items[index], index);
          else
            return UnavailableItem(items[index], index);
        },
      ),
    );
  }
}
