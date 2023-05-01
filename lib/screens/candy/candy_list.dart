import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pasticceria/constants/constants.dart';
import 'package:pasticceria/models/candy.dart';
import 'package:pasticceria/screens/candy/controllers/candy_list_controller.dart';
import 'package:pasticceria/widgets/candy_widget.dart';

class CandyListPage extends StatelessWidget {
  const CandyListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          Get.arguments?['category'] ?? 'Riavvia l\'app',
          style: TextStyles.candyListTitle,
        ),
      ),
      body: GetBuilder<CandyListController>(
        builder: (controller) => GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            mainAxisExtent: 300,
          ),
          scrollDirection: Axis.vertical,
          itemCount: controller.candyList.length,
          itemBuilder: (context, index) {
            Candy candy = controller.candyList[index];

            bool even = index.floor().isEven;

            return CandyWidget(candy: candy, even: even);
          },
        ),
      ),
    );
  }
}
