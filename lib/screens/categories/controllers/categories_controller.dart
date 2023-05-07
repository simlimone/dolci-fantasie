import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pasticceria/constants/constants.dart';
import 'package:pasticceria/models/category.dart';

class CategoriesController extends GetxController {
  static final to = Get.find<CategoriesController>();

  RxList categories = <Category>[].obs;
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
    List fetched = await getCategories();
    categories.value = fetched;
    update();
  }

  Future<List<Category>> getCategories() async {
    var doc = await Strings.categoriesDocument.get();
    List<Category> returnList = [];

    for (var name in doc.data()?['list']) {
      List<dynamic> namesList = doc.data()?['list'];
      int index = namesList.indexOf(name);

      returnList.add(Category(name: name, image: doc.data()?['images'][index]));
    }

    return returnList;
  }

  Future<void> createNewCategory() async {
    await Fluttertoast.cancel();
    Fluttertoast.showToast(
      msg: "Scegli l'immagine",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0,
    );

    var choosenImage = await setCategoryPicture(null);

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

    var choosenName = await setCategoryName(null);

    if (choosenImage != null && choosenName != null) {
      await Strings.categoriesDocument.update(
        {
          'images': FieldValue.arrayUnion([choosenImage]),
          'list': FieldValue.arrayUnion([choosenName]),
        },
      );

      initialSetup();
    }
  }

  Future<String?> setCategoryPicture(Category? category) async {
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image == null) {
      return null;
    }

    String? imageUrl = await uploadImageOnStorage(image);

    if (category != null) {
      List<Category> categories = await getCategories();

      int index = categories.indexOf(category);

      Category newCategory = Category(
        image: imageUrl,
        name: category.name,
      );

      categories.setAll(index, [newCategory]);

      await Strings.categoriesDocument.update(
        {
          'images': categories.map((e) => e.image).toList(),
        },
      );

      initialSetup();
    }

    return imageUrl;
  }

  Future<String?> setCategoryName(Category? category) async {
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

    if (category != null) {
      List<Category> categories = await getCategories();

      int index = categories.indexOf(category);

      Category newCategory = Category(
        image: category.image,
        name: newName,
      );

      categories.setAll(index, [newCategory]);

      await Strings.categoriesDocument.update(
        {
          'list': categories.map((e) => e.name).toList(),
        },
      );

      initialSetup();
    }

    return newName;
  }

  Future<String?> uploadImageOnStorage(XFile image) async {
    File file = File(image.path);
    var imageRef = Strings.categoriesFolder.child(image.name);

    try {
      await imageRef.putFile(file);
      return await imageRef.getDownloadURL();
    } on FirebaseException {
      return null;
    }
  }

  Future<void> deleteCategory(Category category) async {
    await Strings.categoriesDocument.update(
      {
        'images': FieldValue.arrayRemove([category.image]),
        'list': FieldValue.arrayRemove([category.name]),
      },
    );

    initialSetup();
  }

  Future<bool?> confirmCategoryDeletion() async {
    var dialog = await Get.dialog(AlertDialog(
      title: const Text("Sei sicuro?"),
      content: const Text("Vuoi davvero eliminare questa categoria?"),
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
