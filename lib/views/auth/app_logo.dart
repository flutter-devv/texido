import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:texido_app/constants/asset_constants.dart';
import 'package:texido_app/constants/colors_constants.dart';
import 'package:texido_app/constants/sizes_constants.dart';
import 'package:texido_app/widgets/custom_text.dart';

class AppLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Column(
        children: [
          SvgPicture.asset(
            AppAssets.splash,
            height: AppSize.size * 8,
          ),
          SizedBox(height: AppSize.size),
          MediumText(
            text: "Redefining elegance!",
            size: AppSize.medium,
            color: AppColors.blueGrey,
          ),
        ],
      ),
    );
  }
}
