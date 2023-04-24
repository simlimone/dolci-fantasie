import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pasticceria/constants/constants.dart';
import 'package:pasticceria/screens/about-us/about_us_controller.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AboutUsController>(
      builder: (controller) => Scaffold(
        appBar: AppBar(
          title: Text(
            controller.about.value?.name ?? 'Dolci Fantasie',
            style: TextStyles.candyDetailTitle,
          ),
        ),
        body: ListView(
          children: [
            CarouselSlider(
              items: controller.about.value?.images
                  ?.map((e) => CachedNetworkImage(
                        imageUrl: e,
                      ))
                  .toList(),
              options: CarouselOptions(height: 300),
            ),
            if (controller.about.value?.description != null)
              const Padding(
                padding: BestPaddings.candyDescriptionLabel,
                child: Text(
                  "Descrizione",
                  style: TextStyles.candyDescriptionLabel,
                ),
              ),
            if (controller.about.value?.description != null)
              Padding(
                padding: BestPaddings.candyDescription,
                child: Text(controller.about.value!.description!),
              ),
          ],
        ),
      ),
    );
  }
}
