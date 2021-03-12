import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:texido_app/constants/app_constants.dart';
import 'package:texido_app/controllers/table.dart';
import 'package:texido_app/views/home/grid/grid.dart';
import 'custom_app_bar.dart';
import 'tap_item.dart';
import 'floor/floor.dart';
import 'list/list.dart';
import 'member/member.dart';

class HomeScreen extends StatelessWidget {
  final controller = Get.put(TableController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          CustomAppBar(),
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
                            icon: tap1,
                            index: 0,
                          ),
                          TapItem(
                            label: "Res.",
                            icon: tap2,
                            index: 1,
                          ),
                          TapItem(
                            label: "Grid",
                            icon: tap3,
                            index: 2,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          TapItem(
                            label: "Members",
                            icon: tap4,
                            index: 3,
                          ),
                          TapItem(
                            label: "Reports",
                            icon: tap6,
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
                        () => controller.category[1] == true
                            ? ListScreen()
                            : controller.category[2] == true
                                ? GridScreen()
                                : controller.category[3] == true
                                    ? Member()
                                    : controller.category[0] == true
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
