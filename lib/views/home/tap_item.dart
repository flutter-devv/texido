import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:texido_app/constants/app_constants.dart';
import 'package:texido_app/controllers/table.dart';
import 'package:texido_app/widgets/custom_text.dart';

class TapItem extends StatelessWidget {
  final String label;
  final String icon;
  final int index;
  TapItem({
    this.label,
    this.icon,
    this.index,
  });
  final controller = Get.find<TableController>();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GestureDetector(
        onTap: () {
          controller.category
              .assignAll(List.filled(controller.category.length, false));
          controller.category[index] = true;
        },
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: size * 4.5,
                width: size * 0.3,
                color: controller.category[index] ? redColor : transparentColor,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    icon,
                    height: size * 1.3,
                    color: controller.category[index] ? redColor : blackColor,
                  ),
                  SizedBox(height: size * 0.5),
                  RegularText(
                    text: label,
                    size: font3,
                    color: controller.category[index] ? redColor : darkGrey03,
                  ),
                ],
              ),
              Container(),
            ],
          ),
        ),
      ),
    );
  }
}
