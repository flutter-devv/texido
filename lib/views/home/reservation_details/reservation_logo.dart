import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:texido_app/constants/asset_constants.dart';
import 'package:texido_app/constants/colors_constants.dart';
import 'package:texido_app/constants/sizes_constants.dart';
import 'package:texido_app/widgets/custom_text.dart';

class ReservationLogo extends StatelessWidget {
  final int guestsNumber;
  final int tableNumber;
  final bool tableActivated;
  ReservationLogo({
    this.guestsNumber,
    this.tableNumber,
    this.tableActivated,
  });
  @override
  Widget build(BuildContext context) {
    return Positioned(
      child: Container(
        height: AppSize.size * 8,
        width: AppSize.size * 8,
        color: Color(0xffF7F7F8),
        child: Stack(
          alignment: Alignment.center,
          children: [
            SvgPicture.asset(
              guestsNumber > 02 ? AppAssets.doubleTable : AppAssets.table,
              height: guestsNumber > 02 ? AppSize.size * 5 : AppSize.size * 4,
              color:
                  tableActivated ? AppColors.greenColor : AppColors.blueGrey4,
            ),
            Positioned(
              child: tableActivated
                  ? SvgPicture.asset(
                      AppAssets.check,
                      height: AppSize.size * 1.5,
                    )
                  : Text(''),
              left: AppSize.size * 1.5,
              top: AppSize.size * 1.5,
            ),
            RegularText(
              text: tableNumber.toString(),
              size: AppSize.size * 1.8,
              color: AppColors.whiteColor,
            ),
          ],
        ),
      ),
      right: AppSize.size,
      top: AppSize.size,
    );
  }
}
