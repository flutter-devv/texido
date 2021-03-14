import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:texido_app/constants/app_constants.dart';
import 'package:texido_app/constants/asset_constants.dart';
import 'package:texido_app/controllers/grid.dart';
import 'package:texido_app/controllers/reservation.dart';
import 'package:texido_app/controllers/table.dart';
import 'package:texido_app/views/home/grid/grid.dart';
import 'home_bar.dart';
import 'tap_item.dart';
import 'floor/floor.dart';
import 'list/list.dart';
import 'member/member.dart';

class HomeScreen extends StatelessWidget {
  final tableController = Get.put(TableController());
  final reservationController = Get.put(ReservationController());
  @override
  Widget build(BuildContext context) {
    tableController.getTablesData(context);
    tableController.colorList[0] = true;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          HomeBar(),
          Divider(height: 0.0),
          Expanded(
            child: Row(
              children: [
                Container(
                  width: size * 5.5,
                  color: whiteColor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          TapItem(
                            label: "Floor",
                            icon: AppAssets.tap1,
                            index: 0,
                          ),
                          TapItem(
                            label: "Res.",
                            icon: AppAssets.tap2,
                            index: 1,
                          ),
                          TapItem(
                            label: "Grid",
                            icon: AppAssets.tap3,
                            index: 2,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          TapItem(
                            label: "Members",
                            icon: AppAssets.tap4,
                            index: 3,
                          ),
                          TapItem(
                            label: "Reports",
                            icon: AppAssets.tap6,
                            index: 5,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      VerticalDivider(width: 0.0),
                      Expanded(
                          child: Obx(
                        () => tableController.category[1] == true
                            ? ListScreen()
                            : tableController.category[2] == true
                                ? GridScreen()
                                : tableController.category[3] == true
                                    ? Member()
                                    : tableController.category[0] == true
                                        ? FloorScreen()
                                        : Center(
                                            child: Text("Under Development")),
                      )),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
