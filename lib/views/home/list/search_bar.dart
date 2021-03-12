import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:texido_app/constants/app_constants.dart';
import 'package:texido_app/controllers/table.dart';
import 'package:texido_app/widgets/custom_button.dart';
import 'package:texido_app/widgets/custom_field.dart';

class SearchBar extends StatelessWidget {
  final controller = Get.find<TableController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: size * 5,
      color: darkBlueColor,
      padding: EdgeInsets.only(left: size, top: size * 1.2, bottom: size * 1.2),
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
              fieldController: controller.listSearchController.value,
              onChanged: (newValue) {
                controller.searchedList.clear();
                if (newValue == "")
                  controller.searchedList.value.clear();
                else {
                  controller.tables.forEach((e) {
                    if (e.name.toLowerCase().contains(newValue.toLowerCase()))
                      controller.searchedList.add(e);
                  });
                }
              },
              validate: (newValue) {
                if (controller.searchedList.isEmpty && newValue != "") {
                  return "";
                }
              },
              autoValidate: true,
            ),
          ),
          SizedBox(width: size * 2),
          Expanded(
            flex: 2,
            child: Obx(
              () => Row(
                children: [
                  CustomButton(
                      label: "Arrived (5)",
                      labelSize: font2,
                      buttonColor: whiteColor,
                      labelColor: controller.selected[0]
                          ? redColor
                          : blackColor03.withOpacity(0.5),
                      onPressed: () {
                        controller.selected.assignAll(List.filled(3, false));
                        controller.selected[0] = true;
                        controller.getTablesData();
                      }),
                  SizedBox(width: size * 0.8),
                  CustomButton(
                      label: "Seated (12)",
                      labelSize: font2,
                      buttonColor: whiteColor,
                      labelColor: controller.selected[1]
                          ? redColor
                          : blackColor03.withOpacity(0.5),
                      onPressed: () {
                        controller.selected.assignAll(List.filled(3, false));
                        controller.selected[1] = true;
                        controller.getTablesData();
                      }),
                  SizedBox(width: size * 0.8),
                  CustomButton(
                    label: "Upcoming (3)",
                    labelSize: font2,
                    buttonColor: whiteColor,
                    labelColor: controller.selected[2]
                        ? redColor
                        : blackColor03.withOpacity(0.5),
                    onPressed: () {
                      controller.selected.assignAll(List.filled(3, false));
                      controller.selected[2] = true;
                      controller.getTablesData();
                    },
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
