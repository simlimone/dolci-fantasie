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
        appBar: controller.about.value?.title != null
            ? AppBar(
                title: Text(
                  controller.about.value?.title ?? 'Dolci Fantasie',
                  style: TextStyles.candyDetailTitle,
                ),
              )
            : AppBar(
                title: Image.asset(
                  'assets/logo/fantasie-256.png',
                  color: Colors.white,
                  height: 100,
                ),
              ),
        body: ListView(
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                CarouselSlider(
                  items: controller.about.value?.images
                          ?.map((e) => CachedNetworkImage(
                                imageUrl: e,
                              ))
                          .toList() ??
                      [],
                  options: CarouselOptions(
                    height: 300,
                    enlargeCenterPage: true,
                    onPageChanged: (index, reason) =>
                        controller.carouselIndex.value = index,
                  ),
                ),
                if (controller.firebaseUser.value != null)
                  Align(
                    alignment: Alignment.bottomRight,
                    child: MaterialButton(
                      shape: const CircleBorder(),
                      padding: BestPaddings.backButton,
                      textColor: Colors.red,
                      color: Colors.white,
                      child: const Icon(
                        Icons.delete_forever,
                        size: 18,
                      ),
                      onPressed: () async => await controller
                          .deleteImage(controller.carouselIndex.value),
                    ),
                  ),
                if (controller.firebaseUser.value != null)
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: MaterialButton(
                      shape: const CircleBorder(),
                      padding: BestPaddings.backButton,
                      textColor: Colors.blue[300],
                      color: Colors.white,
                      child: const Icon(
                        Icons.add_a_photo,
                        size: 18,
                      ),
                      onPressed: () async => await controller.addPicture(),
                    ),
                  ),
              ],
            ),
            if (controller.about.value?.description != null)
              const Padding(
                padding: BestPaddings.candyDescriptionLabel,
                child: Text(
                  "Descrizione",
                  style: TextStyles.candyDescriptionLabel,
                ),
              ),
            controller.firebaseUser.value != null
                ? Padding(
                    padding: BestPaddings.candyDescription,
                    child: TextField(
                      controller: controller.descriptionController,
                      maxLines: null,
                    ),
                  )
                : Padding(
                    padding: BestPaddings.candyDescription,
                    child: Text(controller.about.value?.description ??
                        'Caricamento...'),
                  ),
            if (controller.firebaseUser.value != null)
              Padding(
                padding: BestPaddings.candyDescription,
                child: ElevatedButton(
                  child: const Text("Salva Descrizione"),
                  onPressed: () async => await controller.saveDescription(),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
