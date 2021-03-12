import 'package:flutter/material.dart';
import 'floor_list.dart';
import 'gate_logo.dart';

class FloorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        FloorList(),
        GateLogo(),
      ],
    );
  }
}
