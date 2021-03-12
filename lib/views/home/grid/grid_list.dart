import 'package:flutter/material.dart';
import 'package:texido_app/models/table.dart';
import 'activated_item.dart';
import 'deactivated_item.dart';

class GridList extends StatelessWidget {
  final List<TableInfo> items;
  GridList(this.items);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        if (items[index].activated == true)
          return ActivatedItem(items[index]);
        else
          return DeactivatedItem(items[index]);
      },
    );
  }
}
