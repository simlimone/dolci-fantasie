import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pasticceria/screens/auth/controllers/auth_controller.dart';
import 'package:pasticceria/screens/home/controllers/home_controller.dart';
import 'package:pasticceria/widgets/category_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          GetX<AuthController>(
            builder: (controller) {
              if (controller.firebaseUser.value != null &&
                  controller.firestoreUser.value != null &&
                  controller.firestoreUser.value!.isAdmin != null &&
                  controller.firestoreUser.value!.isAdmin!) {
                return IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () => Get.toNamed('/new-category'),
                );
              }

              return const SizedBox();
            },
          ),
        ],
      ),
      body: SafeArea(
        child: GetBuilder<HomeController>(
          builder: (controller) => ListView.builder(
            itemCount: controller.categories.length,
            scrollDirection: Axis.vertical,
            itemExtent: 170,
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
