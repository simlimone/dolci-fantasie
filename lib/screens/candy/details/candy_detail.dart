import 'package:cached_network_image/cached_network_image.dart';
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
          SizedBox(
            height: Get.size.height / 3,
            child: Hero(
                tag: candy.tag ?? '',
                child: CachedNetworkImage(
                  imageUrl: candy.images?.first ?? '',
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                  fit: BoxFit.cover,
                )),
          ),
          const Divider(
            color: DefaultColors.primaryColor,
            thickness: 10,
            height: 10,
          ),
          Padding(
            padding: BestPaddings.candyDescriptionLabel,
            child: Text(
              candy.name ?? '',
              style: TextStyles.candyDetailName,
            ),
          ),
          Padding(
            padding: BestPaddings.candyDescription,
            child: Text(
              candy.description ?? 'Nessuna descrizione',
              style: TextStyles.candyDescription,
            ),
          ),
          Container(
            margin: BestPaddings.candyDescription,
            padding: BestPaddings.allergeniInside,
            decoration: BoxDecoration(
              borderRadius: DefaultBorders.allergeniContainer,
              color: DefaultColors.secondaryColor,
            ),
            child: const Text(
              "CONTATTACI PER INFO SUGLI ALLERGENI",
              style: TextStyles.allergeni,
            ),
          ),
        ],
      ),
    );
  }
}
