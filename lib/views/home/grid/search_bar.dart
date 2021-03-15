import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:texido_app/constants/app_constants.dart';
import 'package:texido_app/controllers/grid.dart';
import 'package:texido_app/controllers/table.dart';
import 'package:texido_app/widgets/custom_button.dart';
import 'package:texido_app/widgets/custom_field.dart';
import 'package:texido_app/widgets/custom_text.dart';

class SearchBar extends StatelessWidget {
  final tableController = Get.find<TableController>();
  final gridController = Get.find<GridController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: size * 5,
      color: darkBlueColor,
      padding: EdgeInsets.only(
        left: size,
        top: size * 1.2,
        bottom: size * 1.2,
      ),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: CustomField(
              hint: "Search Guest",
              vertical: size,
              filled: true,
              errorText: true,
              filledColor: whiteColor,
              prefix: Icon(Icons.search, size: size * 1.5),
              fieldController: gridController.searchController,
              onChanged: (newValue) {
                gridController.clearSearchedData();
                if (newValue == "") {
                  gridController.clearSearchedData();
                } else {
                  tableController.tables.forEach(
                    (e) {
                      if (e.name
                          .toLowerCase()
                          .contains(newValue.toLowerCase())) {
                        if (e.time == "4:00 AM")
                          gridController.searched4AMGuests.add(e);
                        else if (e.time == "5:00 AM")
                          gridController.searched5AMGuests.add(e);
                        else
                          gridController.searched6AMGuests.add(e);
                      }
                    },
                  );
                }
              },
              validate: (newValue) {
                if (gridController.searched4AMGuests.isEmpty &&
                    gridController.searched5AMGuests.isEmpty &&
                    gridController.searched6AMGuests.isEmpty &&
                    newValue != "") {
                  return "";
                }
              },
              autoValidate: true,
            ),
          ),
          SizedBox(width: size * 2),
          Obx(
            () => Expanded(
              flex: 2,
              child: Row(
                children: [
                  CustomButton(
                      label: "Arrived (5)",
                      labelSize: font2,
                      buttonColor: whiteColor,
                      labelColor: gridController.selectedTap[0]
                          ? redColor
                          : blackColor03.withOpacity(0.5),
                      onPressed: () {
                        gridController.selectedTap
                            .assignAll(List.filled(3, false));
                        gridController.selectedTap[0] = true;
                        gridController.getGridData(context);
                      }),
                  SizedBox(width: size * 0.8),
                  CustomButton(
                      label: "Seated (12)",
                      labelSize: font2,
                      buttonColor: whiteColor,
                      labelColor: gridController.selectedTap[1]
                          ? redColor
                          : blackColor03.withOpacity(0.5),
                      onPressed: () {
                        gridController.selectedTap
                            .assignAll(List.filled(3, false));
                        gridController.selectedTap[1] = true;
                        gridController.getGridData(context);
                      }),
                  SizedBox(width: size * 0.8),
                  CustomButton(
                    label: "Upcoming (3)",
                    labelSize: font2,
                    buttonColor: whiteColor,
                    labelColor: gridController.selectedTap[2]
                        ? redColor
                        : blackColor03.withOpacity(0.5),
                    onPressed: () {
                      gridController.selectedTap
                          .assignAll(List.filled(3, false));
                      gridController.selectedTap[2] = true;
                      gridController.getGridData(context);
                    },
                  ),
                  SizedBox(width: size * 0.8),
                  Container(
                    height: Get.height,
                    padding: EdgeInsets.all(size * 0.7),
                    decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        RegularText(
                          text: "Reservation time",
                          size: font2,
                          color: darkGrey03,
                        ),
                        Icon(
                          Icons.keyboard_arrow_down_outlined,
                          color: darkGrey03,
                          size: size * 1.3,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
