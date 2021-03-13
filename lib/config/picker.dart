import 'package:flutter/material.dart';

class Picker {
  Future<DateTime> selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2030, 8),
    );
    return picked;
  }
}
