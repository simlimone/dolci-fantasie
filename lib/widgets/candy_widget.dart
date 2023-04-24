import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pasticceria/constants/constants.dart';

import 'package:pasticceria/models/candy.dart';
import 'package:pasticceria/screens/candy/details/candy_detail.dart';

class CandyWidget extends StatelessWidget {
  final Candy candy;

  const CandyWidget({
    Key? key,
    required this.candy,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: DefaultBorders.candyContainer,
      onTap: () => Get.bottomSheet(
        CandyDetailPage(
          candy: candy,
        ),
        isDismissible: true,
        shape: const RoundedRectangleBorder(
          borderRadius: DefaultBorders.candySheet,
        ),
        ignoreSafeArea: false,
      ),
      child: Container(
        margin: BestPaddings.candyContainerExt,
        decoration: BoxDecoration(
          borderRadius: DefaultBorders.candyContainer,
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
            Padding(
              padding: BestPaddings.candyContainerInt,
              child: Text(
                candy.name ?? 'Disabilitato',
                style: TextStyles.candyListLabel,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
