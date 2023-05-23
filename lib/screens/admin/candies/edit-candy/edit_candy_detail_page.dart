import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:pasticceria/constants/constants.dart';
import 'package:pasticceria/models/candy.dart';
import 'package:pasticceria/screens/admin/candies/controllers/edit_candy_detail_controller.dart';

class EditCandyDetailPage extends GetView<EditCandyDetailController> {
  const EditCandyDetailPage({
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
            onPressed: () async => !controller.backAlertSent.value
                ? await controller.sendSaveToast()
                : Get.back(),
          ),
        ),
        actions: [
          Padding(
            padding: BestPaddings.backButton,
            child: MaterialButton(
              shape: const CircleBorder(),
              padding: BestPaddings.backButton,
              textColor: Colors.green,
              color: Colors.white,
              child: const Icon(
                Icons.save_outlined,
                size: 20,
              ),
              onPressed: () async => await controller.saveUpdates(candy),
            ),
          ),
        ],
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
                            (e) => e != null
                                ? CachedNetworkImage(
                                    imageUrl: e,
                                    fit: BoxFit.cover,
                                  )
                                : const Icon(Icons.error),
                          )
                          .toList(),
                      options: CarouselOptions(
                        height: Get.size.height / 2,
                        viewportFraction: 1,
                        onPageChanged: (index, reason) =>
                            controller.currentCarouselPage.value = index,
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
                ),
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
                    onPressed: () async => await controller.deleteImage(
                        candy, controller.currentCarouselPage.value),
                  ),
                ),
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
                    onPressed: () async => await controller.addPicture(candy),
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: BestPaddings.candyDescriptionLabel,
            child: Text(
              "Categoria",
              style: TextStyles.candyDescriptionLabel,
            ),
          ),
          Padding(
              padding: BestPaddings.candyDescription,
              child: Obx(
                () => DropdownButton(
                  items: controller.categories
                      .map(
                        (element) => DropdownMenuItem(
                          value: element,
                          child: Text(element.name ?? 'Nessuna categoria'),
                        ),
                      )
                      .toList(),
                  onChanged: (value) =>
                      controller.selectedCategory.value = value,
                  value: controller.selectedCategory.value,
                ),
              )),
          const Padding(
            padding: BestPaddings.candyDescriptionLabel,
            child: Text(
              "Nome",
              style: TextStyles.candyDescriptionLabel,
            ),
          ),
          Padding(
            padding: BestPaddings.candyDescription,
            child: TextField(
              controller: controller.candyNameController,
              maxLines: null,
              style: TextStyles.candyDescription,
            ),
          ),
          const Padding(
            padding: BestPaddings.candyDescriptionLabel,
            child: Text(
              "Costo",
              style: TextStyles.candyDescriptionLabel,
            ),
          ),
          Padding(
            padding: BestPaddings.candyDescription,
            child: TextField(
              controller: controller.candyPriceController,
              maxLines: 1,
              style: TextStyles.candyDescription,
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
            child: TextField(
              controller: controller.candyDescriptionController,
              maxLines: null,
              style: TextStyles.candyDescription,
            ),
          ),
        ],
      ),
    );
  }
}
