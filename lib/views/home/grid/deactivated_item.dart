import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:texido_app/constants/app_constants.dart';
import 'package:texido_app/constants/asset_constants.dart';
import 'package:texido_app/models/table.dart';
import 'package:texido_app/widgets/custom_text.dart';

class DeactivatedItem extends StatelessWidget {
  final TableInfo table;
  DeactivatedItem(this.table);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size * 9,
      child: Card(
        elevation: 0.0,
        color: whiteColor,
        margin: EdgeInsets.only(bottom: size, left: size),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size, vertical: size),
          child: Row(
            children: [
              Container(
                height: size * 2.5,
                width: size * 4,
                decoration: BoxDecoration(
                  color: greyColor02.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(3.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SemiBoldText(
                      text: "TA-${table.table}",
                      color: darkGrey03,
                      size: font1,
                    ),
                  ],
                ),
              ),
              SizedBox(width: size),
              Row(
                children: [
                  MediumText(
                    text: "Main room",
                    size: font1,
                    color: darkGrey04,
                  ),
                  SizedBox(width: size),
                  Row(
                    children: [
                      SvgPicture.asset(
                        AppAssets.tap4,
                        height: size * 0.8,
                        color: darkGrey04,
                      ),
                      SizedBox(width: size * 0.5),
                      MediumText(
                        text: table.guests.value <= 2 ? "1-2" : "3-4",
                        size: font1,
                        color: darkGrey04,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
