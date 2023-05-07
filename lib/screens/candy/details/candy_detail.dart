import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:pasticceria/constants/constants.dart';
import 'package:pasticceria/models/candy.dart';

class CandyDetailPage extends StatelessWidget {
  const CandyDetailPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Candy candy = Get.arguments;

    CarouselController carouselController = CarouselController();

    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: BestPaddings.backButton,
          child: MaterialButton(
            shape: const CircleBorder(),
            padding: BestPaddings.backButton,
            textColor: Colors.black87,
            color: Colors.white,
            child: const Icon(
              Icons.arrow_back_ios_new_outlined,
              size: 16,
            ),
            onPressed: () => Get.back(),
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      extendBodyBehindAppBar: true,
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Hero(
            tag: candy.tag ?? '',
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: ClipRRect(
                    borderRadius: DefaultBorders.candySheet,
                    child: CarouselSlider(
                      carouselController: carouselController,
                      items: candy.images
                          ?.map(
                            (e) => CachedNetworkImage(
                              imageUrl: e,
                              fit: BoxFit.cover,
                            ),
                          )
                          .toList(),
                      options: CarouselOptions(
                        height: Get.size.height / 2,
                        viewportFraction: 1,
                        scrollDirection: Axis.horizontal,
                      ),
                    ),
                  ),
                ),
                const Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 15.0),
                    child: Text(
                      "Scorri per vedere le altre immagini",
                      style: TextStyles.candyHint,
                    ),
                  ),
                )
              ],
            ),
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
    );
  }
}
