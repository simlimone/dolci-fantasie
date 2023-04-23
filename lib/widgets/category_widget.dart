import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:pasticceria/constants/constants.dart';
import 'package:pasticceria/models/category.dart';

class CategoryWidget extends StatelessWidget {
  final Category category;

  const CategoryWidget({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed('/candy-list', arguments: {'category': category.name});
      },
      child: Container(
        padding: BestPaddings.categoryContainer,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: CachedNetworkImageProvider(
                category.image ?? StaticImages.defaultCandy),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.6), // 0 = Colored, 1 = Black & White
              BlendMode.darken,
            ),
          ),
        ),
        child: Center(
          child: Text(
            category.name ?? 'Disabilitato',
            textAlign: TextAlign.center,
            style: TextStyles.categoryLabel,
          ),
        ),
      ),
    );
  }
}
