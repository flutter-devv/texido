import 'package:flutter/material.dart';
import 'package:texido_app/constants/app_constants.dart';
import 'package:texido_app/widgets/custom_text.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final bool hasBorder;
  final Color labelColor;
  final Color borderColor;
  final Color buttonColor;
  final double height;
  final double labelSize;
  final Function onPressed;
  CustomButton({
    this.label,
    this.hasBorder = false,
    this.labelColor = whiteColor,
    this.borderColor = blackColor,
    this.buttonColor = greenColor,
    this.height,
    this.labelSize,
    this.onPressed,
  });
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      padding: EdgeInsets.symmetric(
        horizontal: size,
        vertical: 0.0,
      ),
      onPressed: onPressed,
      child: RegularText(
        text: label,
        size: labelSize,
        color: labelColor,
      ),
      height: height,
      color: buttonColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(3.0),
        side: BorderSide(
          color: hasBorder ? borderColor : transparentColor,
        ),
      ),
    );
  }
}
