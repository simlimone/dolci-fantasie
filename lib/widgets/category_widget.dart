import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:pasticceria/constants/constants.dart';
import 'package:pasticceria/models/category.dart';
import 'package:pasticceria/screens/admin/categories/controllers/categories_controller.dart';

class CategoryWidget extends GetView<CategoriesController> {
  final Category category;
  final bool editMode;

  const CategoryWidget({
    Key? key,
    required this.category,
    this.editMode = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: InkWell(
        onTap: editMode
            ? null
            : () {
                Get.toNamed('/candy-list', arguments: {'category': category});
              },
        child: Container(
          padding: BestPaddings.categoryContainerInt,
          decoration: const BoxDecoration(
            color: Colors.white10,
          ),
          child: Stack(
            children: [
              ClipRRect(
                child: ColorFiltered(
                  colorFilter: ColorFilter.mode(
                    Colors.black
                        .withOpacity(0.4), // 0 = Colored, 1 = Black & White
                    BlendMode.darken,
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: 150,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: CachedNetworkImageProvider(
                                category.image ?? StaticImages.defaultCandy),
                          ),
                        ),
                      ),
                      if (editMode)
                        IconButton(
                          icon: const Icon(Icons.change_circle),
                          onPressed: () async =>
                              await controller.setCategoryPicture(category),
                        ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 30.0,
                    bottom: 10,
                  ),
                  child: InkWell(
                    onTap: editMode
                        ? () async => await controller.setCategoryName(category)
                        : null,
                    child: Text(
                      category.name ?? 'Disabilitato',
                      textAlign: TextAlign.left,
                      style: TextStyles.categoryLabel,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
