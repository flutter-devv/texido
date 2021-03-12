import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:texido_app/constants/app_constants.dart';
import 'package:texido_app/controllers/member.dart';

class UserImage extends StatelessWidget {
  final controller = Get.find<MemberController>();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: CircleAvatar(
        radius: size * 2.2,
        backgroundColor: greyColor01.withOpacity(0.3),
        child: controller.imagePath.value.isEmpty
            ? Stack(
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
              )
            : CircleAvatar(
                radius: size * 2.2,
                backgroundImage: FileImage(File(controller.imagePath.value)),
              ),
      ),
      onTap: () => controller.uploadImage(),
    );
  }
}
