import 'package:flutter/material.dart';
import 'package:texido_app/constants/app_constants.dart';
import 'package:texido_app/widgets/custom_text.dart';

class Note extends StatelessWidget {
  final String userName;
  final String note;
  Note({
    this.userName,
    this.note,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size),
      child: Row(
        children: [
          MediumText(
            text: userName,
            color: greyColor06,
            size: font1,
          ),
          SizedBox(width: size),
          RegularText(
            text: note,
            color: greyColor06,
            size: font1,
          ),
          Spacer(),
          RegularText(
            text: "5:00 PM, 27 Jan 2021",
            color: greyColor06.withOpacity(0.4),
            size: font1,
          ),
        ],
      ),
    );
  }
}
