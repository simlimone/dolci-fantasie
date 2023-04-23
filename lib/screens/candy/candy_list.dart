import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:pasticceria/models/candy.dart';
import 'package:pasticceria/screens/candy/controllers/candy_list_controller.dart';
import 'package:pasticceria/widgets/candy_widget.dart';

class CandyListPage extends StatelessWidget {
  const CandyListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<CandyListController>(
        builder: (controller) => GridView.builder(
          gridDelegate: SliverWovenGridDelegate.count(
            crossAxisCount: 2,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            pattern: [
              const WovenGridTile(1),
              const WovenGridTile(
                5 / 7,
                crossAxisRatio: 0.9,
                alignment: AlignmentDirectional.centerEnd,
              ),
            ],
          ),
          scrollDirection: Axis.vertical,
          itemCount: controller.candyList.length,
          itemBuilder: (context, index) {
            Candy candy = controller.candyList[index];

            return CandyWidget(candy: candy);
          },
        ),
      ),
    );
  }
}
