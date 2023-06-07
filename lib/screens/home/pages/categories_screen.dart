import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pasticceria/screens/home/controllers/home_controller.dart';
import 'package:pasticceria/widgets/category_widget.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("PRODOTTI")),
      body: SafeArea(
        child: GetBuilder<HomeController>(
          builder: (controller) => ListView.builder(
            itemCount: controller.categories.length,
            scrollDirection: Axis.vertical,
            itemExtent: 150,
            itemBuilder: (context, index) {
              var category = controller.categories[index];

              if (category.name == null || category.image == null) {
                return const SizedBox(height: 0, width: 0);
              }

              return CategoryWidget(
                category: category,
              );
            },
          ),
        ),
      ),
    );
  }
}
