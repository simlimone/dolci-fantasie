import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pasticceria/screens/admin/categories/controllers/categories_controller.dart';
import 'package:pasticceria/widgets/category_widget.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/logo/fantasie-256.png',
          color: Colors.white,
          height: 100,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () async =>
                await CategoriesController.to.createNewCategory(),
          )
        ],
      ),
      body: SafeArea(
        child: GetBuilder<CategoriesController>(
          builder: (controller) => ListView.builder(
            itemCount: controller.categories.length,
            scrollDirection: Axis.vertical,
            itemExtent: 150,
            itemBuilder: (context, index) {
              var category = controller.categories[index];

              if (category.name == null || category.image == null) {
                return const SizedBox(height: 0, width: 0);
              }

              return Dismissible(
                key: UniqueKey(),
                background: Container(
                  color: Colors.red,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Icon(Icons.delete),
                      Icon(Icons.delete),
                    ],
                  ),
                ),
                confirmDismiss: (direction) async {
                  return await controller.confirmCategoryDeletion();
                },
                onDismissed: (direction) async {
                  await controller.deleteCategory(category);
                },
                child: CategoryWidget(
                  category: category,
                  editMode: true,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
