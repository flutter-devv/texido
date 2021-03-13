import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:texido_app/constants/app_constants.dart';
import 'package:texido_app/controllers/member.dart';
import 'package:texido_app/widgets/custom_button.dart';
import 'package:texido_app/widgets/custom_field.dart';

class SearchBar extends StatelessWidget {
  final controller = Get.find<MemberController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: size * 5,
      color: darkBlueColor,
      padding: EdgeInsets.only(
        left: size,
        top: size * 1.2,
        bottom: size * 1.2,
      ),
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: Row(
              children: [
                Expanded(
                  child: CustomField(
                    hint: "Search member",
                    vertical: size,
                    filled: true,
                    errorText: true,
                    filledColor: whiteColor,
                    prefix: Icon(Icons.search, size: size * 1.5),
                    fieldController: controller.searchController,
                    onChanged: (newValue) {
                      print("new value: $newValue");
                      controller.searchedMembers.clear();
                      if (newValue == "")
                        controller.searchedMembers.clear();
                      else {
                        print("yes");
                        controller.members.forEach((e) {
                          print("name: ${e.firstName} ${e.lastName}");
                          if ('${e.firstName} ${e.lastName}'
                              .toLowerCase()
                              .contains(newValue.toLowerCase()))
                            controller.searchedMembers.add(e);
                        });
                      }
                    },
                    validate: (newValue) {
                      print("cc :${controller.searchedMembers.length}");
                      if (controller.searchedMembers.isEmpty &&
                          newValue != "") {
                        //   controller.searchedMembers.value.clear();
                        return "";
                      }
                    },
                    autoValidate: true,
                  ),
                ),
                SizedBox(width: size),
                CustomButton(
                  label: "+  Add",
                  onPressed: () {
                    controller.addMember.value = true;
                    controller.viewMember.value = false;
                  },
                  buttonColor: greenColor,
                  height: Get.height,
                  labelSize: font3,
                ),
              ],
            ),
          ),
          Expanded(flex: 6, child: Container()),
        ],
      ),
    );
  }
}
