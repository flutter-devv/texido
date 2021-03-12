import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:texido_app/constants/app_constants.dart';
import 'package:texido_app/controllers/table.dart';
import 'package:texido_app/models/table.dart';
import 'package:texido_app/widgets/custom_button.dart';
import 'package:texido_app/widgets/custom_field.dart';
import 'package:texido_app/widgets/custom_text.dart';

class NewReservation extends StatefulWidget {
  @override
  _NewReservationState createState() => _NewReservationState();
}

class _NewReservationState extends State<NewReservation> {
  final controller = Get.find<TableController>();
  TextEditingController nameController = TextEditingController();
  TextEditingController mobileController = TextEditingController(text: "+966");
  TextEditingController noteController = TextEditingController();
  TextEditingController memberController = TextEditingController();

  final List<String> items = [
    "Member",
    "Name",
    "Mobile",
    "Date",
    "Time",
    "Guests",
    "Table",
    "Notes"
  ];

  Widget buildContainer(String val, Widget child, {Color color}) {
    return Padding(
      padding: EdgeInsets.only(bottom: size * 0.5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: size * 3,
            alignment: Alignment.centerLeft,
            child: RegularText(
              text: val,
              size: font1,
              color: greyColor06.withOpacity(0.5),
            ),
          ),
          Expanded(child: child),
        ],
      ),
    );
  }

  DateTime pickedDate = DateTime.now();
  TimeOfDay pickedTime = TimeOfDay.now();
  List<TableInfo> deactivatedTables = [];
  Future<void> pickDate(BuildContext context, DateTime initialDate) async {
    DateTime date = await showDatePicker(
      context: context,
      firstDate: DateTime(DateTime.now().year),
      lastDate: DateTime(DateTime.now().year + 5),
      initialDate: initialDate,
    );
    if (date != null) {
      setState(() {
        pickedDate = date;
      });
    }
  }

  Future<void> pickTime(BuildContext context) async {
    TimeOfDay t = await showTimePicker(
        context: context, initialTime: TimeOfDay(hour: 2, minute: 4));
    if (t != null) {
      setState(() {
        pickedTime = t;
      });
    }
  }

  int guests = 00;
  int table;

  @override
  Widget build(BuildContext context) {
    List<TableInfo> deactivatedTables = [];
    memberController = TextEditingController(text: "None");
    controller.tables.forEach((e) {
      if (!e.activated) deactivatedTables.add(e);
    });
    var months = [
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
    return Container(
      height: Get.height / 1.3,
      alignment: Alignment.topCenter,
      margin: EdgeInsets.only(top: size, right: size * 0.5),
      child: Container(
        height: Get.height / 1.3,
        color: blueGrey3,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: size * 2.2,
                padding: EdgeInsets.symmetric(horizontal: size),
                decoration: BoxDecoration(
                  color: Color(0xffF4F4F5),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MediumText(
                      text: "New Reservation",
                      color: greyColor06,
                      size: font3,
                    ),
                    GestureDetector(
                      child: Icon(
                        Icons.close,
                        size: size * 1.5,
                        color: Color(0xffFF4C4D),
                      ),
                      onTap: () => controller.newReservation.value = false,
                    ),
                  ],
                ),
              ),
              Container(
                height: Get.height / 1.5,
                color: whiteColor,
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: EdgeInsets.only(top: size, left: size),
                        child: Column(
                          children: [
                            buildContainer(
                              items[0],
                              Align(
                                alignment: Alignment.centerLeft,
                                child: RegularText(
                                  text: "None",
                                  size: font1,
                                  color: greyColor06,
                                ),
                              ),
                            ),
                            buildContainer(
                              items[1],
                              CustomField(
                                fieldController: nameController,
                                autoValidate: false,
                                vertical: size * 0.7,
                                hintSize: font2,
                                hintColor: Color(0xffA2A2A2).withOpacity(0.4),
                                borderColor: borderColor02,
                              ),
                            ),
                            buildContainer(
                              items[2],
                              CustomField(
                                fieldController: mobileController,
                                autoValidate: false,
                                vertical: size * 0.7,
                                hintSize: font2,
                                hintColor: Color(0xffA2A2A2).withOpacity(0.4),
                                borderColor: borderColor02,
                              ),
                              color: greyColor02.withOpacity(0.1),
                            ),
                            buildContainer(
                              items[3],
                              GestureDetector(
                                onTap: () async {
                                  await pickDate(context, DateTime.now());
                                },
                                child: Container(
                                  height: size * 2.3,
                                  alignment: Alignment.centerRight,
                                  padding:
                                      EdgeInsets.symmetric(horizontal: size),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(3.0),
                                    border: Border.all(color: borderColor02),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      RegularText(
                                        text:
                                            "${pickedDate.day} ${months[pickedDate.month]} ${pickedDate.year}",
                                        color: greyColor06,
                                        size: font1,
                                      ),
                                      SvgPicture.asset(calendar,
                                          height: size * 1.1),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            buildContainer(
                              items[4],
                              GestureDetector(
                                onTap: () async {
                                  await pickTime(context);
                                },
                                child: Container(
                                  height: size * 2.3,
                                  alignment: Alignment.centerRight,
                                  padding:
                                      EdgeInsets.symmetric(horizontal: size),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(3.0),
                                    border: Border.all(color: borderColor02),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      RegularText(
                                        text: pickedTime
                                            .format(context)
                                            .toString(),
                                        color: greyColor06,
                                        size: font1,
                                      ),
                                      SvgPicture.asset(clock,
                                          height: size * 1.1,
                                          color: greyColor06),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            buildContainer(
                              items[5],
                              Container(
                                height: size * 2.3,
                                alignment: Alignment.centerRight,
                                padding: EdgeInsets.symmetric(horizontal: size),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(3.0),
                                  border: Border.all(color: borderColor02),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    RegularText(
                                      text: guests.toString(),
                                      color: greyColor06,
                                      size: font1,
                                    ),
                                    Row(
                                      children: [
                                        GestureDetector(
                                          child: SvgPicture.asset(minus,
                                              height: size * 1.1,
                                              color: greyColor06),
                                          onTap: () {
                                            if (guests > 1)
                                              setState(() {
                                                guests--;
                                              });
                                          },
                                        ),
                                        SizedBox(width: size * 0.5),
                                        GestureDetector(
                                            child: SvgPicture.asset(plus,
                                                height: size * 1.1,
                                                color: greyColor06),
                                            onTap: () {
                                              setState(() {
                                                guests++;
                                              });
                                            }),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: size),
                            buildContainer(
                              items[6],
                              Align(
                                alignment: Alignment.centerLeft,
                                child: RegularText(
                                  text: table == null
                                      ? "Table ${controller.tables[0].table}"
                                      : "Table $table",
                                  size: font1,
                                  color: greyColor06,
                                ),
                              ),
                            ),
                            SizedBox(height: size),
                            buildContainer(
                              items[7],
                              CustomField(
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
                                          borderRadius:
                                              BorderRadius.circular(3.0),
                                        ),
                                        child: SemiBoldText(
                                          text:
                                              "TA-${deactivatedTables[index].table}",
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
                                            text: deactivatedTables[index]
                                                        .guests <=
                                                    2
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
              Container(
                height: size * 3.2,
                decoration: BoxDecoration(color: Color(0xffF4F4F5)),
                child: ButtonBar(
                  children: [
                    CustomButton(
                      label: "Cancel",
                      labelColor: darkGrey03,
                      buttonColor: transparentColor,
                      borderColor: darkGrey03,
                      labelSize: font2,
                      onPressed: () => controller.newReservation.value = false,
                      hasBorder: true,
                    ),
                    SizedBox(width: size * 0.5),
                    CustomButton(
                        label: "Reserve",
                        labelColor: whiteColor,
                        buttonColor: greenColor,
                        labelSize: font2,
                        onPressed: () {
                          controller.tables[table] = TableInfo(
                            member: "Golden membership",
                            name: nameController.text,
                            mobile: mobileController.text,
                            date: pickedDate.obs,
                            // date: DateTime.parse(
                            //         "${pickedDate.day} ${months[pickedDate.month]} ${pickedDate.year}")
                            //     .obs,
                            time: pickedTime.toString().obs,
                            guests: guests.obs,
                            table: table == null
                                ? controller.tables[0].table
                                : table,
                            notes: [noteController.text],
                            activated: true,
                          );
                          controller.newReservation.value = false;
                        }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
