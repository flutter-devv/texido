import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:texido_app/controllers/table.dart';
import 'package:texido_app/models/table.dart';

class GridController extends GetxController {
  final tableController = Get.find<TableController>();
  RxList<TableInfo> tables4AM = List<TableInfo>().obs;
  RxList<TableInfo> tables5AM = List<TableInfo>().obs;
  RxList<TableInfo> tables6AM = List<TableInfo>().obs;
  RxList<TableInfo> searched4AMGuests = List<TableInfo>().obs;
  RxList<TableInfo> searched5AMGuests = List<TableInfo>().obs;
  RxList<TableInfo> searched6AMGuests = List<TableInfo>().obs;
  RxList<bool> selectedTap = [true, false, false].obs;
  RxBool didCall = false.obs;
  TextEditingController searchController = TextEditingController();

  void getGridData(BuildContext context) {
    clearGridData();
    didCall.value = true;
    tableController.getTablesData(context);
    for (int i = 0; i < tableController.tables.length; ++i) {
      if (tableController.tables[i].time == "4:00 AM")
        tables4AM.add(tableController.tables[i]);
      else if (tableController.tables[i].time == "5:00 AM")
        tables5AM.add(tableController.tables[i]);
      else
        tables6AM.add(tableController.tables[i]);
    }
  }

  void clearSearchedData() {
    searched4AMGuests.clear();
    searched5AMGuests.clear();
    searched6AMGuests.clear();
  }

  void clearGridData() {
    tables4AM.clear();
    tables5AM.clear();
    tables6AM.clear();
  }
}
