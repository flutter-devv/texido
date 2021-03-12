import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:texido_app/constants/app_constants.dart';

class GateLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: size,
      child: Container(
        decoration: BoxDecoration(
            color: blueGrey4,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.0),
              bottomLeft: Radius.circular(10.0),
            )),
        child: SvgPicture.asset(gate),
      ),
    );
  }
}
