import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:texido_app/constants/app_constants.dart';
import 'package:texido_app/constants/asset_constants.dart';
import 'package:texido_app/controllers/table.dart';
import 'package:texido_app/models/table.dart';
import 'package:texido_app/widgets/custom_text.dart';

class ListItem extends StatelessWidget {
  final TableInfo item;
  final int index;
  ListItem(this.item, this.index);
  final controller = Get.find<TableController>();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GestureDetector(
        onTap: () {
          controller.colorList
              .assignAll(List.filled(controller.colorList.length, false));
          controller.colorList[index] = true;
          controller.index.value = index;
        },
        child: Container(
          height: size * 5.5,
          color: controller.colorList[index] ? blueGrey5 : transparentColor,
          padding: EdgeInsets.symmetric(horizontal: size, vertical: size),
          child: Row(
            children: [
              Row(
                children: [
                  Container(
                    height: size * 3,
                    width: size * 3,
                    decoration: BoxDecoration(
                      color: blueGrey2.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(3.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SemiBoldText(
                          text: item.time.substring(0, 4),
                          color: darkGrey03,
                          size: font1,
                        ),
                        SemiBoldText(
                          text: item.time.substring(5, 7),
                          color: darkGrey03,
                          size: size * 0.4,
                        ),
                      ],
                    ),
                  ),
                  VerticalDivider(
                      color: blackColor02.withOpacity(0.05), thickness: 1.5),
                ],
              ),
              SizedBox(width: size),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MediumText(
                            text: item.name,
                            color: blackColor05,
                            size: font1,
                          ),
                          SizedBox(height: size * 0.6),
                          MediumText(
                            text: "+966 ${item.mobile}",
                            color: blackColor05,
                            size: font1,
                          ),
                        ],
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MediumText(
                          text: item.member,
                          color: blackColor05,
                          size: font1,
                        ),
                        SizedBox(height: size * 0.6),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            SvgPicture.asset(
                              AppAssets.tap4,
                              height: size * 0.8,
                              color: blackColor05,
                            ),
                            SizedBox(width: size * 0.5),
                            MediumText(
                              text: item.guests <= 02 ? "3-4" : "1-2",
                              color: blackColor05,
                              size: font1,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: size * 1.6,
                      width: size * 4.5,
                      child: SemiBoldText(
                        text: "TA-${item.table}",
                        size: font1,
                        color: blackColor06,
                      ),
                      decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(3.0),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
