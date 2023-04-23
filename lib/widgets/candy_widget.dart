import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pasticceria/constants/constants.dart';

import 'package:pasticceria/models/candy.dart';

class CandyWidget extends StatelessWidget {
  final Candy candy;

  const CandyWidget({
    Key? key,
    required this.candy,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Get.theme.primaryColor.withOpacity(.4),
      ),
      child: Column(
        children: [
          Expanded(
            child: CachedNetworkImage(
              imageUrl: candy.images?.first ?? StaticImages.defaultCandy,
              fit: BoxFit.cover,
            ),
          ),
          Text(
            candy.name ?? 'Disabilitato',
            style: TextStyles.candyListLabel,
          ),
        ],
      ),
    );
  }
}
