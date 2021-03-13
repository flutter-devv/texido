import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:texido_app/constants/app_constants.dart';
import 'package:texido_app/controllers/grid.dart';
import 'package:texido_app/controllers/table.dart';
import 'package:texido_app/widgets/custom_text.dart';
import 'search_bar.dart';
import 'grid_list.dart';

class GridScreen extends StatelessWidget {
  final tableController = Get.find<TableController>();
  final gridController = Get.put(GridController());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        color: blueGrey3,
        child: Column(
          children: [
            SearchBar(),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        SizedBox(height: size * 0.5),
                        RegularText(
                          text: "4:00 AM",
                          size: font3,
                          color: greyColor07,
                        ),
                        SizedBox(height: size * 0.5),
                        Expanded(
                          child: gridController.searched4AMGuests.isEmpty
                              ? GridList(gridController.tables4AM)
                              : GridList(gridController.searched4AMGuests),
                        ),
                      ],
                    ),
                  ),
                  VerticalDivider(color: greyColor01.withOpacity(0.5)),
                  Expanded(
                    child: Column(
                      children: [
                        SizedBox(height: size * 0.5),
                        RegularText(
                          text: "5:00 AM",
                          size: font3,
                          color: greyColor07,
                        ),
                        SizedBox(height: size * 0.5),
                        Expanded(
                          child: gridController.searched5AMGuests.isEmpty
                              ? GridList(gridController.tables5AM)
                              : GridList(gridController.searched5AMGuests),
                        ),
                      ],
                    ),
                  ),
                  VerticalDivider(color: greyColor01.withOpacity(0.5)),
                  Expanded(
                    child: Column(
                      children: [
                        SizedBox(height: size * 0.5),
                        RegularText(
                          text: "6:00 AM",
                          size: font3,
                          color: greyColor07,
                        ),
                        SizedBox(height: size * 0.5),
                        Expanded(
                          child: gridController.searched6AMGuests.isEmpty
                              ? GridList(gridController.tables6AM)
                              : GridList(gridController.searched6AMGuests),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
