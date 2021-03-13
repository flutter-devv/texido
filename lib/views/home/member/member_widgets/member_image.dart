import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:texido_app/constants/app_constants.dart';
import 'package:texido_app/controllers/member.dart';

class MemberImage extends StatelessWidget {
  final String memberImage;
  MemberImage({this.memberImage});
  final controller = Get.find<MemberController>();
  @override
  Widget build(BuildContext context) {
    if (memberImage == null) {
      if (controller.imagePath.value.isEmpty)
        return GestureDetector(
          child: CircleAvatar(
            radius: size * 2.2,
            backgroundColor: greyColor01.withOpacity(0.3),
            child: Stack(
              children: [
                Center(
                  child: Icon(
                    Icons.person_outline,
                    color: greyColor02,
                    size: size * 2,
                  ),
                ),
                Positioned(
                  child: Icon(Icons.camera_alt_outlined,
                      color: greyColor02, size: size * 1.2),
                  top: size * 0.5,
                  right: size * 0.8,
                ),
              ],
            ),
          ),
          onTap: () => controller.uploadImage(),
        );
      else
        return CircleAvatar(
          radius: size * 2.2,
          backgroundColor: greyColor01.withOpacity(0.3),
          backgroundImage: FileImage(File(controller.imagePath.value)),
        );
    } else
      return CircleAvatar(
        radius: size * 2.2,
        backgroundColor: greyColor01.withOpacity(0.3),
        backgroundImage: FileImage(File(memberImage)),
      );
  }
}
