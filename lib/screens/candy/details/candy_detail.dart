import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:pasticceria/constants/constants.dart';
import 'package:pasticceria/models/candy.dart';

class CandyDetailPage extends StatelessWidget {
  final Candy candy;

  const CandyDetailPage({
    Key? key,
    required this.candy,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: DefaultBorders.candySheet,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            candy.name ?? 'Disabilitato',
            style: TextStyles.candyDetailTitle,
          ),
        ),
        body: ListView(
          children: [
            CarouselSlider(
              items: candy.images
                  ?.map((e) => CachedNetworkImage(imageUrl: e))
                  .toList(),
              options: CarouselOptions(height: 300),
            ),
            Padding(
              padding: BestPaddings.candyDescriptionLabel,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Descrizione",
                    style: TextStyles.candyDescriptionLabel,
                  ),
                  Text(
                    candy.price ?? '',
                    style: TextStyles.candyDescriptionLabel,
                  ),
                ],
              ),
            ),
            Padding(
              padding: BestPaddings.candyDescription,
              child: Text(
                candy.description ?? 'Nessuna descrizione',
                style: TextStyles.candyDescription,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
