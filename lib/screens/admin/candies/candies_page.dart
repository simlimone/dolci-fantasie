import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pasticceria/models/candy.dart';
import 'package:pasticceria/screens/admin/candies/controllers/candies_controller.dart';
import 'package:pasticceria/widgets/candy_widget.dart';

class CandiesPage extends StatelessWidget {
  const CandiesPage({super.key});

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
            onPressed: () async => await CandiesController.to.createNewCandy(),
          )
        ],
      ),
      body: SafeArea(
        child: GetBuilder<CandiesController>(
          builder: (controller) => GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent: Get.size.height / 4,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
            ),
            itemCount: controller.candies.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              Candy candy = controller.candies[index];
              bool even = index.floor().isEven;

              if (candy.name == null || candy.images == null) {
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
                  return await controller.confirmCandyDeletion();
                },
                onDismissed: (direction) async {
                  await controller.deleteCandy(candy);
                },
                child: CandyWidget(
                  candy: candy,
                  even: even,
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
