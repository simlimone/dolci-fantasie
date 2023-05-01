import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:pasticceria/constants/constants.dart';
import 'package:pasticceria/models/candy.dart';

class CandyWidget extends StatelessWidget {
  final Candy candy;
  final bool even;

  const CandyWidget({
    Key? key,
    required this.candy,
    required this.even,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      margin: even
          ? BestPaddings.candyContainerExt(left: true)
          : BestPaddings.candyContainerExt(right: true),
      child: InkWell(
        borderRadius: DefaultBorders.candyContainer,
        onTap: () => Get.toNamed(
          '/candy-detail',
          arguments: candy,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Material(
                elevation: 4,
                borderRadius: DefaultBorders.candyContainer,
                child: ClipRRect(
                  borderRadius: DefaultBorders.candyContainer,
                  child: CachedNetworkImage(
                    imageUrl: candy.images?.first ?? StaticImages.defaultCandy,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: BestPaddings.candyContainerInt,
              child: Text(
                candy.name ?? 'Disabilitato',
                style: TextStyles.candyListLabel,
              ),
            ),
            Padding(
              padding: BestPaddings.candyContainerInt,
              child: Text(
                candy.price ?? '',
                style: TextStyles.candyListLabel,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
