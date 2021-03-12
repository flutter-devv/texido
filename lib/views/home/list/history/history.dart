import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:texido_app/constants/app_constants.dart';
import 'package:texido_app/controllers/table.dart';
import 'package:texido_app/models/table.dart';
import 'package:texido_app/widgets/custom_button.dart';
import 'package:texido_app/widgets/custom_field.dart';
import 'package:texido_app/widgets/custom_text.dart';
import 'history_item.dart';

class History extends StatelessWidget {
  final TableInfo table;
  History(this.table);
  final TextEditingController noteController = TextEditingController();
  final controller = Get.find<TableController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height / 2.5,
      color: whiteColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: size * 2.2,
            padding: EdgeInsets.symmetric(horizontal: size),
            width: Get.width,
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
              color: Color(0xffF4F4F5),
            ),
            child: MediumText(
              text: "History",
              size: font3,
              color: greyColor06,
            ),
          ),
          SizedBox(height: size),
          Expanded(
            child: ListView.builder(
              itemCount: table.notes.length,
              itemBuilder: (context, index) {
                return Note(
                  userName: table.name,
                  note: table.notes[index],
                );
              },
            ),
          ),
          SizedBox(height: size),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size),
            child: CustomField(
              fieldController: noteController,
              hint: "Add notes goes here",
              vertical: size * 1.5,
              autoValidate: false,
              hintSize: font1,
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            margin: EdgeInsets.only(right: size),
            child: CustomButton(
              label: "Add notes",
              labelColor: greenColor,
              buttonColor: transparentColor,
              borderColor: greenColor,
              labelSize: font2,
              onPressed: () {
                table.notes.add(noteController.text);
                controller.edit.value = false;
              },
              hasBorder: true,
              height: size * 2,
            ),
          ),
        ],
      ),
    );
  }
}
