import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:texido_app/constants/app_constants.dart';
import 'package:texido_app/widgets/custom_text.dart';
import 'confirm_button.dart';
import 'scanning_data.dart';
import 'user_image.dart';
import 'user_info.dart';

class QRVerified extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: transparentColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SemiBoldText(
              text: "Member Reservation confirmed",
              size: font5,
              color: whiteColor,
            ),
            SizedBox(height: size * 3),
            Container(
              height: size * 24,
              width: Get.width,
              margin: EdgeInsets.symmetric(horizontal: size * 20),
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: size * 2.8),
                    child: Container(
                      color: whiteColor,
                      child: Column(
                        children: [
                          UserInfo(
                            userName: "Saleem Salman",
                            userPhone: "+976 123456789",
                            membership: "Gold",
                          ),
                          SizedBox(height: size),
                          ScanningData(
                            tableNumber: "45",
                            peopleNumber: "2",
                          ),
                        ],
                      ),
                    ),
                  ),
                  UserImage(
                    "https://dq1eylutsoz4u.cloudfront.net/2016/12/07190305/not-so-nice-nice-guy.jpg",
                  ),
                ],
              ),
            ),
            SizedBox(height: size * 1.5),
            ConfirmButton(),
          ],
        ),
      ),
    );
  }
}
