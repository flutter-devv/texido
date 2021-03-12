import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:texido_app/widgets/custom_text.dart';

class ItemLogo extends StatelessWidget {
  final int guestsNumber;
  final int tableNumber;
  final bool tableActivated;
  ItemLogo({
    this.guestsNumber,
    this.tableNumber,
    this.tableActivated,
  });
  @override
  Widget build(BuildContext context) {
    return Positioned(
      child: Container(
        height: size * 8,
        width: size * 8,
        color: Color(0xffF7F7F8),
        child: Stack(
          alignment: Alignment.center,
          children: [
            SvgPicture.asset(
              guestsNumber > 2 ? doubleTable : item,
              height: guestsNumber > 2 ? size * 5 : size * 4,
              color: tableActivated ? greenColor : blueGrey4,
            ),
            Positioned(
              child: tableActivated
                  ? SvgPicture.asset(
                      check,
                      height: size * 1.5,
                    )
                  : Text(''),
              left: size * 1.5,
              top: size * 1.5,
            ),
            RegularText(
              text: tableNumber.toString(),
              size: size * 1.8,
              color: whiteColor,
            ),
          ],
        ),
      ),
      right: size,
      top: size,
    );
  }
}
