import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:texido_app/constants/app_constants.dart';
import 'package:texido_app/constants/asset_constants.dart';

class UserImage extends StatelessWidget {
  final String userImage;
  UserImage(this.userImage);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: whiteColor, width: size * 0.4),
        image: DecorationImage(
          image: NetworkImage(userImage),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            child: SvgPicture.asset(check, height: size * 1.3),
            right: 0.0,
            top: 0.0,
          ),
        ],
      ),
      height: size * 6,
      width: size * 6,
    );
  }
}
