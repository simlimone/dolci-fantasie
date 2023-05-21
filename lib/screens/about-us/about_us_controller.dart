import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pasticceria/constants/constants.dart';
import 'package:pasticceria/models/about.dart';
import 'package:pasticceria/screens/auth/controllers/auth_controller.dart';

class AboutUsController extends GetxController {
  static final to = Get.find<AboutUsController>();

  late ImagePicker picker;
  late TextEditingController descriptionController;

  Rxn<About> about = Rxn<About>();

  RxInt carouselIndex = 0.obs;

  Rxn<User?> get firebaseUser => AuthController.instance.firebaseUser;

  @override
  void onInit() {
    picker = ImagePicker();

    descriptionController = TextEditingController();

    super.onInit();
  }

  @override
  void onReady() async {
    about.value = await setupAbout();
    descriptionController.text = about.value?.description ?? '';
    update();

    super.onReady();
  }

  Future<About?> setupAbout() async {
    var doc = await Strings.aboutDocument.get();

    if (doc.exists) {
      return About.fromMap(doc.data()!);
    }

    return null;
  }

  Future<void> deleteImage(int carouselIndex) async {
    String? imageToDelete = about.value?.images?[carouselIndex];

    if (imageToDelete == null) {
      return;
    }

    await Strings.aboutDocument.update({
      'images': FieldValue.arrayRemove([imageToDelete])
    });
    Get.back(closeOverlays: true);
  }

  Future<void> addPicture() async {
    final List<XFile> images = await picker.pickMultiImage();

    if (images.isEmpty) {
      return;
    }

    List<String?> imageUrls = await uploadImageOnStorage(images);

    if (imageUrls.isNotEmpty) {
      await Strings.aboutDocument
          .update({'images': FieldValue.arrayUnion(imageUrls)});
      Get.back(closeOverlays: true);
    }
  }

  Future<List<String?>> uploadImageOnStorage(List<XFile> images) async {
    List<String?> returnList = [];

    for (var image in images) {
      File file = File(image.path);
      var imageRef = Strings.aboutFolder.child(image.name);

      try {
        await imageRef.putFile(file);
        returnList.add(await imageRef.getDownloadURL());
      } on FirebaseException {
        returnList.add(null);
      }
    }

    return returnList;
  }

  Future<void> saveDescription() async {
    String description = descriptionController.text.trim();

    await Strings.aboutDocument
        .update({'description': description.isEmpty ? null : description});
  }
}
