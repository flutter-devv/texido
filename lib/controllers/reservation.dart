import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:texido_app/controllers/table.dart';
import 'package:texido_app/models/table.dart';

class ReservationController extends GetxController {
  final controller = Get.find<TableController>();
  // reservation info
  RxString member = "".obs;
  Rx<DateTime> date = DateTime.now().obs;
  RxString time = "".obs;
  RxInt guests = 00.obs;
  // field controllers
  TextEditingController nameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController noteController = TextEditingController();
  // picked date & time
  DateTime pickedDate = DateTime.now();
  TimeOfDay pickedTime = TimeOfDay.now();

  insertData(TableInfo table) {
    member.value = table.member;
    date.value = table.date;
    time.value = table.time;
    guests.value = table.guests;
  }

  insertFieldsData({String name, String mobile, String note}) {
    nameController = TextEditingController(text: name);
    mobileController = TextEditingController(text: mobile);
    noteController = TextEditingController(text: note);
  }

  updateReservation(int index) {
    controller.tables[index].member = member.value;
    controller.tables[index].name = nameController.text;
    controller.tables[index].mobile = mobileController.text;
    controller.tables[index].date = date.value;
    controller.tables[index].time = time.value;
    controller.tables[index].guests = guests.value;
    controller.tables[index].notes = noteController.text;
  }

  Future<void> pickDate(BuildContext context, DateTime initialDate) async {
    DateTime date = await showDatePicker(
      context: context,
      firstDate: DateTime(DateTime.now().year),
      lastDate: DateTime(DateTime.now().year + 5),
      initialDate: initialDate,
    );
    if (date != null) {
      pickedDate = date;
      this.date.value = pickedDate;
    }
  }

  Future<void> pickTime(BuildContext context) async {
    TimeOfDay time = await showTimePicker(
        context: context, initialTime: TimeOfDay(hour: 2, minute: 4));
    if (time != null) {
      pickedTime = time;
      this.time.value = pickedTime.format(context).toString();
    }
  }

  @override
  void dispose() {
    nameController.clear();
    mobileController.clear();
    noteController.clear();
    super.dispose();
  }
}
