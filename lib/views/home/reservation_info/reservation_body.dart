import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:texido_app/constants/asset_constants.dart';
import 'package:texido_app/controllers/reservation.dart';
import 'package:texido_app/models/table.dart';
import 'package:texido_app/widgets/custom_field.dart';
import 'package:texido_app/widgets/custom_text.dart';
import 'reservation_item.dart';
import 'package:texido_app/constants/app_constants.dart';
import 'reservation_tables.dart';

class ReservationBody extends StatelessWidget {
  final TableInfo table;
  final List<TableInfo> tables;
  final int tableIndex;
  ReservationBody({
    this.table,
    this.tables,
    this.tableIndex,
  });
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
  final controller = Get.find<ReservationController>();
  @override
  Widget build(BuildContext context) {
    controller.insertData(table);
    controller.insertFieldsData(
      name: table.name,
      mobile: table.mobile,
      note: table.notes,
    );
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
                      fieldController: controller.nameController,
                      filled: true,
                      filledColor: greyColor03,
                      autoValidate: false,
                      vertical: size * 0.7,
                      hintSize: font2,
                      hintColor: Color(0xffA2A2A2).withOpacity(0.4),
                      borderColor: Colors.transparent,
                      onChanged: null,
                    ),
                  ),
                  ReservationItem(
                    label: labels[2],
                    child: CustomField(
                      fieldController: controller.mobileController,
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
                        await controller.pickDate(context, table.date);
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
                            Obx(
                              () => RegularText(
                                text: "${controller.date.value.day}"
                                    " ${months[controller.date.value.month]} "
                                    "${controller.date.value.year}",
                                color: greyColor06,
                                size: font1,
                              ),
                            ),
                            SvgPicture.asset(AppAssets.calendar,
                                height: size * 1.1),
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
                            Obx(
                              () => RegularText(
                                text: controller.time.value,
                                color: greyColor06,
                                size: font1,
                              ),
                            ),
                            SvgPicture.asset(AppAssets.clock,
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
                          Obx(
                            () => RegularText(
                              text: controller.guests.value.toString(),
                              color: greyColor06,
                              size: font1,
                            ),
                          ),
                          Row(
                            children: [
                              GestureDetector(
                                child: SvgPicture.asset(AppAssets.minus,
                                    height: size * 1.1, color: greyColor06),
                                onTap: () {
                                  if (controller.guests.value > 1)
                                    controller.guests.value--;
                                },
                              ),
                              SizedBox(width: size * 0.5),
                              GestureDetector(
                                  child: SvgPicture.asset(AppAssets.plus,
                                      height: size * 1.1, color: greyColor06),
                                  onTap: () {
                                    controller.guests.value++;
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
                        text: "Table ${table.table}",
                        size: font1,
                        color: greyColor06,
                      ),
                    ),
                  ),
                  SizedBox(height: size),
                  ReservationItem(
                    label: labels[6],
                    child: CustomField(
                      fieldController: controller.noteController,
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
              child: ReservationTables(tables),
            ),
          ],
        ),
      ),
    );
  }
}
