import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:texido_app/constants/app_constants.dart';
import 'package:texido_app/controllers/table.dart';
import 'package:texido_app/views/home/edit_reservation/edit_reservation.dart';
import 'package:texido_app/views/home/reservation_details/reservation_details.dart';
import 'list_item.dart';
import '../new_reservation/new_reservation.dart';
import 'search_bar.dart';

class ListScreen extends StatelessWidget {
  final controller = Get.find<TableController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: blueGrey3,
      child: Column(
        children: [
          SearchBar(),
          Obx(
            () => Expanded(
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Container(
                      color: whiteColor,
                      alignment: Alignment.topCenter,
                      child: ListView.separated(
                        shrinkWrap: true,
                        itemCount: controller.searchedList.isEmpty
                            ? controller.tables.length
                            : controller.searchedList.length,
                        physics: BouncingScrollPhysics(),
                        separatorBuilder: (context, index) {
                          return Divider(
                              color: blackColor02.withOpacity(0.05),
                              thickness: 1.5);
                        },
                        itemBuilder: (context, index) {
                          return controller.searchedList.isEmpty
                              ? ListItem(
                                  controller.tables[index],
                                  index,
                                )
                              : ListItem(
                                  controller.searchedList[index],
                                  index,
                                );
                        },
                      ),
                    ),
                  ),
                  SizedBox(width: size),
                  Expanded(
                    flex: 4,
                    child: controller.edit.value
                        ? EditReservation(
                            table: controller.tables[controller.index.value],
                            isFloor: false,
                          )
                        : controller.newReservation.value
                            ? NewReservation()
                            : ReservationDetails(
                                item: controller.tables[controller.index.value],
                                index: controller.index.value,
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
