import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:texido_app/constants/app_constants.dart';
import 'package:texido_app/controllers/table.dart';
import 'package:texido_app/widgets/custom_button.dart';
import '../edit_reservation.dart';

class BottomButtons extends StatelessWidget {
  final controller = Get.find<TableController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: size * 3.2,
      width: Get.width,
      padding: EdgeInsets.symmetric(horizontal: size),
      color: Color(0xffF4F4F5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomButton(
            label: "Cancel Reservation",
            labelColor: redColor,
            buttonColor: transparentColor,
            labelSize: font2,
            onPressed: () {
              controller.cancelling.value = true;
            },
          ),
          ButtonBar(
            children: [
              CustomButton(
                label: "Edit",
                labelColor: blackColor,
                buttonColor: transparentColor,
                borderColor: greyColor07,
                labelSize: font2,
                onPressed: () {
                  Get.close(1);
                  controller.index.value = index;
                  Get.dialog(
                    Material(
                        color: transparentColor,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: size * 2),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              EditReservation(item, true),
                            ],
                          ),
                        )),
                  );
                },
                hasBorder: true,
              ),
              CustomButton(
                label: "Start seating",
                buttonColor: greenColor,
                labelSize: font2,
                onPressed: () {},
              ),
            ],
          )
          // : Column(
          //     children: [
          //       // textField(
          //       //   hint: "Reason of cancellation",
          //       //   hintColor: Color(0xff353D48),
          //       //   borderColor: Color(0xffB5C3D6),
          //       //   hintSize: f,
          //       //   autoValidate: false,
          //       // ),
          //       customButton(
          //         label: "Cancel Reservation",
          //         buttonColor: transparentColor,
          //         labelColor: redColor,
          //         borderColor: redColor,
          //         onPressed: () => Get.close(1),
          //       ),
          //     ],
          //   ),
        ],
      ),
    );
  }
}
