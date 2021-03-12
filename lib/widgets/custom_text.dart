import 'package:flutter/material.dart';
import 'package:texido_app/constants/app_constants.dart';

class SemiBoldText extends StatelessWidget {
  final String text;
  final double size;
  final Color color;
  SemiBoldText({
    this.text,
    this.size,
    this.color = blueGrey,
  });
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: "Poppins",
        fontSize: size,
        color: color,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}

class MediumText extends StatelessWidget {
  final String text;
  final double size;
  final Color color;
  MediumText({
    this.text,
    this.size,
    this.color = blueGrey,
  });
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: "Poppins",
        fontSize: size,
        color: color,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}

class RegularText extends StatelessWidget {
  final String text;
  final double size;
  final Color color;
  RegularText({
    this.text,
    this.size,
    this.color = blackColor,
  });
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontFamily: "Poppins",
        fontSize: size,
        color: color,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
