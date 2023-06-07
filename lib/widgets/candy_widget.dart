import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:pasticceria/constants/constants.dart';
import 'package:pasticceria/models/candy.dart';

class CandyWidget extends StatelessWidget {
  final Candy candy;
  final bool even;
  final bool editMode;

  const CandyWidget({
    Key? key,
    required this.candy,
    required this.even,
    this.editMode = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String tag = (candy.images?.first ?? StaticImages.defaultCandy) +
        Random().nextInt(1000).toString();

    return InkWell(
      borderRadius: DefaultBorders.candyContainer,
      onTap: () => editMode
          ? Get.toNamed(
              '/edit-candy-detail',
              arguments: candy.copyWith(tag: tag),
            )
          : Get.toNamed(
              '/candy-detail',
              arguments: candy.copyWith(tag: tag),
            ),
      child: Stack(
        children: [
          Hero(
            tag: tag,
            child: Container(
              height: Get.size.width / 2.3,
              margin: even
                  ? BestPaddings.candyContainerExt(left: true)
                  : BestPaddings.candyContainerExt(right: true),
              decoration: BoxDecoration(
                borderRadius: DefaultBorders.candyContainer,
                image: DecorationImage(
                  image: CachedNetworkImageProvider(
                    candy.images?.first ?? StaticImages.defaultCandy,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            top: 10,
            right: -5,
            child: Container(
              padding: BestPaddings.candyPriceLabel,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: DefaultBorders.candyPrice,
              ),
              margin: BestPaddings.candyContainerInt,
              child: Text(
                candy.price ?? '',
                textAlign: TextAlign.end,
                style: TextStyles.candyPrice,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: BestPaddings.candyContainerInt,
              child: Text(
                candy.name ?? 'Disabilitato',
                style: TextStyles.candyListLabel,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
