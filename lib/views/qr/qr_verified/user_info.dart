import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:texido_app/constants/app_constants.dart';
import 'package:texido_app/constants/asset_constants.dart';
import 'package:texido_app/widgets/custom_text.dart';

class UserInfo extends StatelessWidget {
  final String userName;
  final String userPhone;
  final String membership;
  UserInfo({
    this.userName,
    this.userPhone,
    this.membership,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: size * 4),
        MediumText(text: userName, size: font6),
        SizedBox(height: size),
        RegularText(
          text: userPhone,
          size: font3,
          color: greyColor05,
        ),
        SizedBox(height: size),
        prizer(),
      ],
    );
  }

  Widget prizer() {
    return Container(
      width: size * 4.5,
      height: size * 2,
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            prize,
            color: whiteColor,
            height: size,
          ),
          SizedBox(width: size * .5),
          RegularText(
            text: membership,
            size: font3,
            color: whiteColor,
          ),
        ],
      ),
    );
  }
}
