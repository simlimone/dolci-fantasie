import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewCategoryController extends GetxController {
  static final to = Get.find<NewCategoryController>();

  late GlobalKey<FormState> newCategoryFormKey;

  @override
  void onInit() {
    newCategoryFormKey = GlobalKey<FormState>();
    super.onInit();
  }
}
