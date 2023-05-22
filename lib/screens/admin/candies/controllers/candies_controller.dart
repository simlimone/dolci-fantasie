import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pasticceria/constants/constants.dart';
import 'package:pasticceria/models/candy.dart';
import 'package:pasticceria/models/category.dart';

class CandiesController extends GetxController {
  static final to = Get.find<CandiesController>();

  RxList<Candy> candies = <Candy>[].obs;
  late ImagePicker picker;

  @override
  void onInit() {
    picker = ImagePicker();
    super.onInit();
  }

  @override
  void onReady() async {
    await initialSetup();
    super.onReady();
  }

  Future<void> initialSetup() async {
    List<Candy> fetched = await getCandies();
    candies.value = fetched;
    update();
  }

  Future<List<Candy>> getCandies() async {
    var collection = await Strings.candyCollectionGroup.get();
    return collection.docs.map((e) => Candy.fromMap(e.data())).toList();
  }

  Future<void> createNewCandy() async {
    await Fluttertoast.cancel();
    Fluttertoast.showToast(
      msg: "Scegli le immagini",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0,
    );

    var choosenImages = await setCandyPicture(null);

    await Fluttertoast.cancel();
    Fluttertoast.showToast(
      msg: "Scegli il nome",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0,
    );

    var choosenName = await setCandyName(null);

    await Fluttertoast.cancel();
    Fluttertoast.showToast(
      msg: "Scegli la categoria",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0,
    );

    var choosenCategory = await returnCandyCategory(null);

    if (choosenImages != null &&
        choosenName != null &&
        choosenName.isNotEmpty &&
        choosenCategory != null) {
      var doc = Strings.candyInCategoryCollection(choosenCategory.id).doc();

      Candy newCandy = Candy(
        id: doc.id,
        images: choosenImages,
        name: choosenName,
        categoryID: choosenCategory.id,
      );

      await doc.set(newCandy.toMap());

      initialSetup();
    }
  }

  Future<List<String?>?> setCandyPicture(Candy? candy) async {
    final List<XFile> images = await picker.pickMultiImage();

    if (images.isEmpty) {
      return null;
    }

    List<String?> imageUrls = await uploadImageOnStorage(images);

    if (candy != null && candy.categoryID != null) {
      Candy newCandy = candy.copyWith(images: imageUrls);

      await Strings.candyInCategoryCollection(candy.categoryID!)
          .doc(newCandy.id)
          .update(newCandy.toMap());

      initialSetup();
    }

    return imageUrls;
  }

  Future<String?> setCandyName(Candy? candy) async {
    String newName = "";

    var dialog = await Get.dialog(AlertDialog(
      title: const Text("Scegli Nome"),
      content: TextField(
        onChanged: (value) => newName = value,
      ),
      actions: [
        TextButton(
          child: const Text("CAMBIA"),
          onPressed: () => Get.back(result: true),
        ),
        TextButton(
          child: const Text("ANNULLA"),
          onPressed: () => Get.back(result: false),
        ),
      ],
    ));

    if (dialog == null || !dialog) {
      return null;
    }

    if (candy != null && candy.categoryID != null) {
      Candy newCandy = candy.copyWith(name: newName);

      await Strings.candyInCategoryCollection(candy.categoryID!)
          .doc(newCandy.id)
          .update(newCandy.toMap());

      initialSetup();
    }

    return newName;
  }

  Future<List<Category>> getCategories() async {
    var doc = await Strings.categoriesCollection.get();

    return doc.docs.map((e) => Category.fromMap(e.data())).toList();
  }

  Future<Category?> returnCandyCategory(Candy? candy) async {
    List<Category> categories = await getCategories();
    Rxn<Category> newCategory = Rxn<Category>();

    var dialog = await Get.dialog(AlertDialog(
      title: const Text("Scegli Categoria"),
      content: Obx(
        () => DropdownButton<Category>(
          items: categories
              .map((e) => DropdownMenuItem(
                    value: e,
                    enabled: e.name != null,
                    child: Text(e.name ?? 'Disabilitata'),
                  ))
              .toList(),
          value: newCategory.value,
          onChanged: (value) => newCategory.value = value,
        ),
      ),
      actions: [
        TextButton(
          child: const Text("OK"),
          onPressed: () => Get.back(result: true),
        ),
        TextButton(
          child: const Text("ANNULLA"),
          onPressed: () => Get.back(result: false),
        ),
      ],
    ));

    if (dialog == null || !dialog) {
      return null;
    }

    return newCategory.value;
  }

  Future<List<String?>> uploadImageOnStorage(List<XFile> images) async {
    List<String?> returnList = [];

    for (var image in images) {
      File file = File(image.path);
      var imageRef = Strings.categoriesFolder.child(image.name);

      try {
        await imageRef.putFile(file);
        returnList.add(await imageRef.getDownloadURL());
      } on FirebaseException {
        returnList.add(null);
      }
    }

    return returnList;
  }

  Future<void> deleteCandy(Candy candy) async {
    await Strings.candyInCategoryCollection(candy.categoryID)
        .doc(candy.id)
        .delete();

    initialSetup();
  }

  Future<bool?> confirmCandyDeletion() async {
    var dialog = await Get.dialog(AlertDialog(
      title: const Text("Sei sicuro?"),
      content: const Text("Vuoi davvero eliminare questo dolce?"),
      actions: [
        TextButton(
          child: const Text("SI"),
          onPressed: () => Get.back(result: true),
        ),
        TextButton(
          child: const Text("ANNULLA"),
          onPressed: () => Get.back(result: false),
        ),
      ],
    ));

    return dialog;
  }
}
