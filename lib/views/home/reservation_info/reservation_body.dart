import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:texido_app/controllers/table.dart';
import 'package:texido_app/models/table.dart';
import 'package:texido_app/widgets/custom_field.dart';
import 'package:texido_app/widgets/custom_text.dart';
import 'reservation_item.dart';
import 'package:texido_app/constants/app_constants.dart';

class ReservationBody extends StatelessWidget {
  final TableInfo table;
  ReservationBody({this.table});
  TextEditingController nameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController noteController = TextEditingController();
  final List<String> labels = [
    "Member",
    "Name",
    "Mobile",
    "Date",
    "Time",
    "Guests",
    "Table",
    "Notes"
  ];
  final List<String> months = [
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "May",
    "Jun",
    "Jul",
    "Aug",
    "Sept",
    "Oct",
    "Nov",
    "Dec"
  ];
  final controller = Get.find<TableController>();
  @override
  Widget build(BuildContext context) {
    nameController = TextEditingController(text: table.name);
    mobileController = TextEditingController(text: "+966 ${table.mobile}");
    noteController = TextEditingController(text: table.notes[0]);
    return Container(
      height: Get.height / 1.5,
      color: whiteColor,
      child: Padding(
        padding: EdgeInsets.only(top: size, left: size),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  ReservationItem(
                    label: labels[0],
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: RegularText(
                        text: table.member,
                        size: font1,
                        color: greyColor06,
                      ),
                    ),
                  ),
                  ReservationItem(
                    label: labels[1],
                    child: CustomField(
                      fieldController: nameController,
                      filled: true,
                      filledColor: greyColor03,
                      autoValidate: false,
                      vertical: size * 0.7,
                      hintSize: font2,
                      hintColor: Color(0xffA2A2A2).withOpacity(0.4),
                      borderColor: Colors.transparent,
                    ),
                  ),
                  ReservationItem(
                    label: labels[2],
                    child: CustomField(
                      fieldController: mobileController,
                      filled: true,
                      filledColor: greyColor03,
                      autoValidate: false,
                      vertical: size * 0.7,
                      hintSize: font2,
                      hintColor: Color(0xffA2A2A2).withOpacity(0.4),
                      borderColor: Colors.transparent,
                    ),
                  ),
                  ReservationItem(
                    label: labels[3],
                    child: GestureDetector(
                      onTap: () async {
                        await controller.pickDate(
                          context,
                          table.date.value,
                        );
                      },
                      child: Container(
                        height: size * 2.3,
                        alignment: Alignment.centerRight,
                        padding: EdgeInsets.symmetric(horizontal: size),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3.0),
                          border: Border.all(color: borderColor02),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RegularText(
                              text:
                                  "${table.date.value.day} ${months[table.date.value.month]} ${table.date.value.year}",
                              color: greyColor06,
                              size: font1,
                            ),
                            SvgPicture.asset(calendar, height: size * 1.1),
                          ],
                        ),
                      ),
                    ),
                  ),
                  ReservationItem(
                    label: labels[4],
                    child: GestureDetector(
                      onTap: () async {
                        await controller.pickTime(context);
                      },
                      child: Container(
                        height: size * 2.3,
                        alignment: Alignment.centerRight,
                        padding: EdgeInsets.symmetric(horizontal: size),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3.0),
                          border: Border.all(color: borderColor02),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RegularText(
                              text: table.time.value,
                              color: greyColor06,
                              size: font1,
                            ),
                            SvgPicture.asset(clock,
                                height: size * 1.1, color: greyColor06),
                          ],
                        ),
                      ),
                    ),
                  ),
                  ReservationItem(
                    label: labels[5],
                    child: Container(
                      height: size * 2.3,
                      alignment: Alignment.centerRight,
                      padding: EdgeInsets.symmetric(horizontal: size),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3.0),
                        border: Border.all(color: borderColor02),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RegularText(
                            text: table.guests.toString(),
                            color: greyColor06,
                            size: font1,
                          ),
                          Row(
                            children: [
                              GestureDetector(
                                child: SvgPicture.asset(minus,
                                    height: size * 1.1, color: greyColor06),
                                onTap: () {
                                  if (table.guests > 1) table.guests--;
                                },
                              ),
                              SizedBox(width: size * 0.5),
                              GestureDetector(
                                  child: SvgPicture.asset(plus,
                                      height: size * 1.1, color: greyColor06),
                                  onTap: () {
                                    controller.tables[controller.index.value]
                                        .guests++;
                                  }),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: size),
                  ReservationItem(
                    label: labels[6],
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: RegularText(
                        text: "Table $table",
                        size: font1,
                        color: greyColor06,
                      ),
                    ),
                  ),
                  SizedBox(height: size),
                  ReservationItem(
                    label: labels[6],
                    child: CustomField(
                      fieldController: noteController,
                      autoValidate: false,
                      vertical: size,
                      hintSize: font2,
                      hintColor: Color(0xffA2A2A2),
                      borderColor: borderColor02,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: size),
            Expanded(
              flex: 2,
              child: Container(
                color: Color(0xffF4F4F5).withOpacity(0.4),
                padding: EdgeInsets.only(top: size, left: size * 0.5),
                child: ListView.builder(
                  itemCount: deactivatedTables.length,
                  physics: BouncingScrollPhysics(),
                  padding: EdgeInsets.symmetric(horizontal: size * 0.5),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: size),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            table = deactivatedTables[index].table;
                          });
                        },
                        child: Container(
                          child: Row(
                            children: [
                              Container(
                                height: size * 1.8,
                                width: size * 3.5,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: greenColor.withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(3.0),
                                ),
                                child: SemiBoldText(
                                  text: "TA-${deactivatedTables[index].table}",
                                  size: font1,
                                  color: greenColor,
                                ),
                              ),
                              SizedBox(width: size * 0.5),
                              MediumText(
                                text: "Available",
                                size: font1,
                                color: greenColor,
                              ),
                              Spacer(),
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    tap4,
                                    height: size * 0.9,
                                    color: greenColor,
                                  ),
                                  SizedBox(width: size * 0.5),
                                  MediumText(
                                    text: deactivatedTables[index].guests <= 2
                                        ? "1-2"
                                        : "3-4",
                                    size: font1,
                                    color: greenColor,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
