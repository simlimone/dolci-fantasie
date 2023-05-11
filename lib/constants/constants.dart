import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class Strings {
  static final categoriesDocument = settingsCollection.doc('categories');
  static final aboutDocument = settingsCollection.doc('about-us');

  static final settingsCollection =
      FirebaseFirestore.instance.collection('settings');
  static final usersCollection = FirebaseFirestore.instance.collection('users');
  static final candyCollection = FirebaseFirestore.instance.collection('candy');

  // Firebase Storage
  static final categoriesFolder =
      FirebaseStorage.instance.ref().child('categories');
  static final candiesFolder = FirebaseStorage.instance.ref().child('candies');
}

class TextStyles {
  static const categoryLabel = TextStyle(
    fontSize: 25,
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );

  static const candyListLabel = TextStyle(
    fontSize: 20,
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );

  static const candyDetailTitle = TextStyle(
    fontSize: 30,
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );

  static const candyDescriptionLabel = TextStyle(
    fontSize: 21,
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );

  static const candyDescription = TextStyle(
    fontSize: 20,
    color: Colors.white,
    fontWeight: FontWeight.normal,
  );
  static const candyHint = TextStyle(
    fontSize: 14,
    color: Colors.grey,
    fontWeight: FontWeight.normal,
  );

  static const candyListTitle = TextStyle(
    fontSize: 30,
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );
}

class DefaultBorders {
  static final candyContainer = BorderRadius.circular(35);
  static final categoryContainer = BorderRadius.circular(8);
  static const categoryImage = BorderRadius.only(
    topLeft: Radius.circular(8),
    bottomLeft: Radius.circular(8),
    topRight: Radius.circular(0),
    bottomRight: Radius.circular(0),
  );
  static const candySheet = BorderRadius.only(
    bottomLeft: Radius.circular(20),
    bottomRight: Radius.circular(20),
  );
}

class BestPaddings {
  static const categoryContainer = EdgeInsets.symmetric(
    horizontal: 15,
    vertical: 5,
  );
  static const categoryContainerInt = EdgeInsets.only(right: 5);
  static const backButton = EdgeInsets.all(6);
  static candyContainerExt({bool right = false, bool left = false}) =>
      EdgeInsets.only(
        left: left ? 15 : 5,
        right: right ? 15 : 5,
        top: 5,
        bottom: 5,
      );
  static const candyContainerInt = EdgeInsets.only(
    left: 15,
    top: 5,
    bottom: 5,
    right: 5,
  );
  static const candyDescription = EdgeInsets.only(
    left: 25,
    right: 25,
    bottom: 20,
  );
  static const candyDescriptionLabel = EdgeInsets.only(
    left: 25,
    right: 25,
    top: 30,
    bottom: 15,
  );
  static const candyTitleLabel = EdgeInsets.only(
    left: 25,
    right: 25,
    top: 0,
    bottom: 15,
  );
}

class StaticImages {
  static const String defaultCandy =
      "https://www.planetcandy.ie/image/cache/catalog/Placeholders/chocolate-sweets-placeholder-300x300.jpg";
}
