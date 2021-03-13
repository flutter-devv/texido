import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:texido_app/models/table.dart';

class TableController extends GetxController {
  RxList<TableInfo> tables = List<TableInfo>().obs;
  RxList<bool> selected = [true, false, false].obs;
  RxString selectedUser = "Karem Doe".obs;
  Rx<TextEditingController> searchController = TextEditingController().obs;
  RxList<bool> colorList = List<bool>().obs;

  RxBool cancelling = false.obs;
  RxBool newReservation = false.obs;
  RxList<bool> category = [false, true, false, false, false, false].obs;

  Rx<TextEditingController> listSearchController = TextEditingController().obs;
  RxList<TableInfo> searchedList = List<TableInfo>().obs;
  RxBool edit = false.obs;
  RxInt index = 0.obs;
  Rx<DateTime> pickedDate = DateTime.now().obs;
  Rx<TimeOfDay> pickedTime = TimeOfDay.now().obs;

  TextEditingController nameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController noteController = TextEditingController();

  void getTablesData(BuildContext context) {
    tables.clear();
    String time;
    bool activated;
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
      if (i == 2 || i == 7 || i == 12 || i == 15)
        activated = false;
      else
        activated = true;
      tables.add(
        TableInfo(
          member: "Golden membership",
          name: faker.person.firstName() + ' ' + faker.person.lastName(),
          mobile: "+966" + ' ' + faker.randomGenerator.numbers(9, 9).join(""),
          date: DateTime.now().obs,
          time: time.obs,
          guests: guests.obs,
          table: i,
          notes: faker.lorem.sentences(2),
          activated: activated,
        ),
      );
    }
    colorList.assignAll(List.filled(tables.length, false));
  }

  Future<void> pickDate(
      BuildContext context, DateTime initialDate, int tableIndex) async {
    DateTime date = await showDatePicker(
      context: context,
      firstDate: DateTime(DateTime.now().year),
      lastDate: DateTime(DateTime.now().year + 5),
      initialDate: initialDate,
    );
    if (date != null) {
      pickedDate.value = date;
      tables[tableIndex].date.value = pickedDate.value;
    }
  }

  Future<void> pickTime(BuildContext context, int tableIndex) async {
    TimeOfDay t = await showTimePicker(
        context: context, initialTime: TimeOfDay(hour: 2, minute: 4));
    if (t != null) {
      pickedTime.value = t;
      tables[tableIndex].time.value =
          pickedTime.value.format(context).toString();
    }
  }
}
