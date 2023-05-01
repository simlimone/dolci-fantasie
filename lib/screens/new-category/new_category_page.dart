import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pasticceria/screens/new-category/new_category_controller.dart';

class NewCategoryPage extends GetView<NewCategoryController> {
  const NewCategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: controller.newCategoryFormKey,
        child: Container(),
      ),
    );
  }
}
