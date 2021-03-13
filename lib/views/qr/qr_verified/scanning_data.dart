import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:texido_app/constants/app_constants.dart';
import 'package:texido_app/constants/asset_constants.dart';
import 'package:texido_app/widgets/custom_text.dart';

class ScanningData extends StatelessWidget {
  final String tableNumber;
  final String peopleNumber;
  ScanningData({
    this.tableNumber,
    this.peopleNumber,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size, vertical: size * 2),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SvgPicture.asset(AppAssets.tableIcon),
                  SizedBox(width: size),
                  MediumText(
                    text: "Table $tableNumber",
                    size: font3,
                    color: redColor,
                  )
                ],
              ),
              Row(
                children: [
                  SvgPicture.asset(AppAssets.people),
                  SizedBox(width: size * 0.5),
                  RegularText(
                    text: "$peopleNumber People",
                    size: font3,
                  )
                ],
              ),
            ],
          ),
          SizedBox(height: size),
          Divider(),
          SizedBox(height: size),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SvgPicture.asset(AppAssets.clock),
                  SizedBox(width: size),
                  MediumText(
                    text: "When",
                    size: font3,
                    color: redColor,
                  )
                ],
              ),
              RegularText(
                text: "6:00 PM Sunday, Feb 04, 2020",
                size: font3,
              )
            ],
          ),
        ],
      ),
    );
  }
}
