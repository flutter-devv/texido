import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:texido_app/models/table.dart';

class TableController extends GetxController {
  RxList<TableInfo> tables = List<TableInfo>().obs;
  RxList<TableInfo> availableTables = List<TableInfo>().obs;
  RxList<bool> selected = [true, false, false].obs;
  RxString selectedUser = "Karem Doe".obs;
  RxList<bool> colorList = List<bool>().obs;
  RxBool didCall = false.obs;
  RxBool cancelling = false.obs;
  RxBool newReservation = false.obs;
  RxList<bool> category = [false, true, false, false, false, false].obs;

  TextEditingController searchController = TextEditingController();
  TextEditingController listSearchController = TextEditingController();
  TextEditingController historyController = TextEditingController();
  RxList<TableInfo> searchedList = List<TableInfo>().obs;
  RxBool edit = false.obs;
  RxBool closeDetails = false.obs;
  RxInt index = 0.obs;

  void getTablesData(BuildContext context) {
    tables.clear();
    availableTables.clear();
    didCall.value = true;
    String time;
    int guests;
    for (int i = 0; i < 50; ++i) {
      if (i < 10)
        time = TimeOfDay(hour: 4, minute: 00).format(context);
      else if (i < 20)
        time = TimeOfDay(hour: 5, minute: 00).format(context);
      else
        time = TimeOfDay(hour: 6, minute: 00).format(context);
      if (i > 30)
        guests = 04;
      else
        guests = 02;
      if (i == 2 || i == 7 || i == 12 || i == 15) {
        tables.add(
          TableInfo(
            member: '',
            name: '',
            mobile: '',
            date: DateTime.now(),
            time: time,
            guests: guests,
            table: i,
            notes: '',
            available: true,
          ),
        );
      } else {
        tables.add(
          TableInfo(
            member: "Golden membership",
            name: faker.person.firstName() + ' ' + faker.person.lastName(),
            mobile: "+966" + ' ' + faker.randomGenerator.numbers(9, 9).join(""),
            date: DateTime.now(),
            time: time,
            guests: guests,
            table: i,
            notes: "Happy Birthday",
            available: false,
          ),
        );
      }
    }
    for (var table in tables) {
      if (table.available) availableTables.add(table);
    }
    colorList.assignAll(List.filled(tables.length, false));
  }
}
