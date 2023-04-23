import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Strings {
  static final categoriesDocument = settingsCollection.doc('categories');

  static final settingsCollection =
      FirebaseFirestore.instance.collection('settings');
  static final usersCollection = FirebaseFirestore.instance.collection('users');
  static final candyCollection = FirebaseFirestore.instance.collection('candy');
}

class TextStyles {
  static const categoryLabel = TextStyle(
    fontSize: 30,
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );

  static const candyListLabel = TextStyle(
    fontSize: 20,
    color: Colors.black87,
    fontWeight: FontWeight.bold,
  );
}

class BestPaddings {
  static const categoryContainer = EdgeInsets.all(15);
}

class StaticImages {
  static const String defaultCandy =
      "https://www.planetcandy.ie/image/cache/catalog/Placeholders/chocolate-sweets-placeholder-300x300.jpg";
}
