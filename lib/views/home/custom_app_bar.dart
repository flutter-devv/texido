import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:texido_app/constants/app_constants.dart';
import 'package:texido_app/controllers/table.dart';
import 'package:texido_app/views/qr/qr_scanning/qr_scanning.dart';
import 'package:texido_app/widgets/custom_button.dart';
import 'package:texido_app/widgets/custom_text.dart';

class CustomAppBar extends StatelessWidget {
  final controller = Get.find<TableController>();
  final List<String> items = ["Karem Doe", "Samer Doe", "Faris Doe"];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: size * 4,
      color: whiteColor,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(tuxedo, width: size * 5.5, fit: BoxFit.cover),
                Row(
                  children: [
                    SvgPicture.asset(notification, height: size * 1.2),
                    Align(
                      alignment: Alignment.center,
                      child: FlatButton(
                        child: SvgPicture.asset(qrIcon, height: size),
                        color: blueGrey2.withOpacity(0.2),
                        height: size * 2.2,
                        minWidth: size * 2,
                        padding: EdgeInsets.all(0.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3.0),
                        ),
                        onPressed: () => Get.dialog(
                          QRScanning(),
                          barrierColor: blackColor.withOpacity(0.7),
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomButton(
                          label: "+ New Reservation",
                          buttonColor: greenColor,
                          labelSize: font3,
                          onPressed: () =>
                              controller.newReservation.value = true,
                          height: size * 2.2,
                        ),
                      ],
                    ),
                    SizedBox(width: size * 0.5),
                    CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://dq1eylutsoz4u.cloudfront.net/2016/12/07190305/not-so-nice-nice-guy.jpg"),
                      radius: size * 1.2,
                    ),
                    SizedBox(width: size * 0.5),
                    Center(
                      child: DropdownButtonHideUnderline(
                        child: Obx(
                          () => DropdownButton(
                            icon: Icon(Icons.keyboard_arrow_down,
                                color: blackColor01, size: size * 1.5),
                            value: controller.selectedUser.value,
                            dropdownColor: Colors.grey[200],
                            items: items
                                .map<DropdownMenuItem<String>>(
                                  (value) => DropdownMenuItem<String>(
                                    value: value,
                                    child: MediumText(
                                      text: value,
                                      size: font3,
                                      color: blackColor01,
                                    ),
                                  ),
                                )
                                .toList(),
                            onChanged: (newValue) {
                              controller.selectedUser.value = newValue;
                            },
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          Container(
            width: size * 9,
            height: size * 2.2,
            padding: EdgeInsets.symmetric(horizontal: size),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(3.0),
              border: Border.all(color: redColor),
            ),
            child: Row(
              children: [
                SvgPicture.asset(calendar, color: redColor, height: size * 1.2),
                SizedBox(width: size * 0.5),
                RegularText(
                  text: "Tue Jan 2021",
                  size: font3,
                  color: redColor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
