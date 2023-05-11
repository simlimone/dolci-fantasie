import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pasticceria/constants/constants.dart';
import 'package:pasticceria/models/candy.dart';
import 'package:pasticceria/models/category.dart';

class EditCandyDetailController extends GetxController {
  static final to = Get.find<EditCandyDetailController>();

  late ImagePicker picker;

  Rxn<Candy> candy = Rxn<Candy>();
  RxInt currentCarouselPage = 0.obs;

  RxBool backAlertSent = false.obs;

  RxList<Category> categories = <Category>[].obs;
  Rxn<Category> selectedCategory = Rxn<Category>();

  Rxn<List<String?>?> candyImages = Rxn<List<String?>?>();

  TextEditingController? candyDescriptionController;
  TextEditingController? candyNameController;
  TextEditingController? candyPriceController;

  @override
  void onInit() {
    candy.value = Get.arguments;

    picker = ImagePicker();

    candyDescriptionController = TextEditingController(
      text: candy.value?.description ?? 'Nessuna descrizione',
    );
    candyNameController = TextEditingController(
      text: candy.value?.name ?? 'Nessun nome',
    );
    candyPriceController = TextEditingController(
      text: candy.value?.price ?? 'Nessun prezzo',
    );
    candyImages.value = candy.value?.images;

    super.onInit();
  }

  @override
  void onReady() async {
    categories.value = await getCategories();

    selectedCategory.value = categories[candy.value?.categoryNumber ?? 0];

    super.onReady();
  }

  @override
  void onClose() {
    candy.value = null;
    super.onClose();
  }

  Future<void> deleteImage(Candy? candy, int carouselIndex) async {
    if (candy == null) {
      return;
    }

    var tempCandy = candy;
    tempCandy.images?.removeAt(carouselIndex);

    Candy newCandy = candy.copyWith(images: tempCandy.images);

    await Strings.candyCollection.doc(candy.id).update(newCandy.toMap());
    Get.back(closeOverlays: true);
  }

  Future<void> addPicture(Candy? candy) async {
    final List<XFile> images = await picker.pickMultiImage();

    if (images.isEmpty || candy == null) {
      return;
    }

    List<String?> imageUrls = await uploadImageOnStorage(images);

    if (imageUrls.isNotEmpty) {
      await Strings.candyCollection
          .doc(candy.id)
          .update({'images': FieldValue.arrayUnion(imageUrls)});
      Get.back(closeOverlays: true);
    }
  }

  Future<void> saveUpdates(Candy? candy) async {
    if (candy == null) {
      return;
    }

    Candy newCandy = candy.copyWith(
      name: candyNameController?.text.trim(),
      description: candyDescriptionController?.text.trim(),
      price: candyPriceController?.text.trim(),
      categoryNumber: selectedCategory.value?.categoryNumber,
    );

    await Strings.candyCollection.doc(candy.id).update(newCandy.toMap());
    Get.back(closeOverlays: true);
  }

  sendSaveToast() async {
    await Fluttertoast.cancel();
    Fluttertoast.showToast(
      msg: "Assicurati di salvare.",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0,
    );

    backAlertSent.value = true;
  }

  Future<List<Category>> getCategories() async {
    var doc = await Strings.categoriesDocument.get();
    List<Category> returnList = [];

    for (var name in doc.data()?['list']) {
      List<dynamic> namesList = doc.data()?['list'];
      int index = namesList.indexOf(name);

      returnList.add(Category(
        name: name,
        image: doc.data()?['images'][index],
        categoryNumber: index,
      ));
    }

    return returnList;
  }

  Future<List<String?>> uploadImageOnStorage(List<XFile> images) async {
    List<String?> returnList = [];

    for (var image in images) {
      File file = File(image.path);
      var imageRef = Strings.candiesFolder.child(image.name);

      try {
        await imageRef.putFile(file);
        returnList.add(await imageRef.getDownloadURL());
      } on FirebaseException {
        returnList.add(null);
      }
    }

    return returnList;
  }
}
