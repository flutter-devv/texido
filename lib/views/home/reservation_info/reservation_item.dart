import 'package:flutter/material.dart';
import 'package:texido_app/constants/app_constants.dart';
import 'package:texido_app/widgets/custom_text.dart';

class ReservationItem extends StatelessWidget {
  final String label;
  final Widget child;
  ReservationItem({
    this.label,
    this.child,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: size * 0.5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: size * 3,
            alignment: Alignment.centerLeft,
            child: RegularText(
              text: label,
              size: font1,
              color: greyColor06.withOpacity(0.5),
            ),
          ),
          Expanded(child: child),
        ],
      ),
    );
  }
}
