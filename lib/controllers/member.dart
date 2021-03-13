import 'package:faker/faker.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:texido_app/models/member.dart';

class MemberController extends GetxController {
  RxList<String> gender = ["Gender", "Male", "Female"].obs;
  RxList<String> membership = ["Membership", "Gold", "Sliver", "Bronze"].obs;
  RxList<MemberInfo> members = List<MemberInfo>().obs;
  RxList<MemberInfo> searchedMembers = List<MemberInfo>().obs;
  RxBool viewMember = false.obs;
  RxBool addMember = false.obs;
  RxBool addMemberButton = false.obs;
  RxInt memberIndex = 0.obs;
  RxString genderSelected = "".obs;
  RxString membershipSelected = "".obs;
  RxString imagePath = "".obs;
  Rx<DateTime> selectedDate = DateTime.now().obs;
  final picker = ImagePicker();

  // fields controllers
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController noteController = TextEditingController();
  TextEditingController searchController = TextEditingController();

  void getMemberData() {
    for (int i = 0; i < 10; ++i) {
      members.add(
        MemberInfo(
          image: imagePath.value,
          firstName: faker.person.firstName(),
          lastName: faker.person.lastName(),
          phone: "+966" + ' ' + faker.randomGenerator.numbers(9, 9).join(""),
          membership: "Gold membership",
          gender: "male",
          email: faker.internet.email(),
          date: DateTime.now(),
          notes: faker.lorem.sentence(),
        ),
      );
    }
  }

  void addMemberToList() {
    members.insert(
      0,
      MemberInfo(
        image: imagePath.value,
        firstName: firstNameController.text,
        lastName: lastNameController.text,
        phone: phoneController.text,
        membership: membershipSelected.value + " membership",
        gender: genderSelected.value,
        email: emailController.text,
        date: selectedDate.value,
        notes: noteController.text,
      ),
    );
    addMember.value = false;
    selectedDate.value = DateTime.now();
    imagePath.value = "";
  }

  Future<void> uploadImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);
    imagePath.value = pickedFile.path;
  }

  resetData() {
    firstNameController.clear();
    lastNameController.clear();
    phoneController.clear();
    emailController.clear();
    noteController.clear();
    selectedDate.value = DateTime.now();
    imagePath.value = "";
    genderSelected.value = gender[0];
    membershipSelected.value = membership[0];
    addMember.value = false;
    addMemberButton.value = false;
  }

  @override
  void onInit() {
    genderSelected.value = gender[0];
    membershipSelected.value = membership[0];
    getMemberData();
    super.onInit();
  }
}
