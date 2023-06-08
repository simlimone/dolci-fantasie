import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class Strings {
  static final aboutDocument = settingsCollection.doc('about-us');
  static final linksDocument = settingsCollection.doc('links');

  static final settingsCollection =
      FirebaseFirestore.instance.collection('settings');
  static final usersCollection = FirebaseFirestore.instance.collection('users');
  static final categoriesCollection =
      FirebaseFirestore.instance.collection('categories');
  static final candyCollectionGroup =
      FirebaseFirestore.instance.collectionGroup('candy');

  static CollectionReference<Map<String, dynamic>> candyInCategoryCollection(
          String? catID) =>
      categoriesCollection.doc(catID).collection('candy');

  // Firebase Storage
  static final categoriesFolder =
      FirebaseStorage.instance.ref().child('categories');
  static final candiesFolder = FirebaseStorage.instance.ref().child('candies');
  static final aboutFolder = FirebaseStorage.instance.ref().child('about');
}

class TextStyles {
  static const categoryLabel = TextStyle(
    fontSize: 25,
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );
  static const appBarTitle = TextStyle(
    fontSize: 20,
    color: Colors.white,
    fontWeight: FontWeight.normal,
  );

  static const candyListLabel = TextStyle(
    fontSize: 20,
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );

  static const candyPrice = TextStyle(
    fontSize: 16,
    color: Colors.black87,
    fontWeight: FontWeight.normal,
  );

  static const candyDetailTitle = TextStyle(
    fontSize: 30,
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );
  static const candyDetailName = TextStyle(
    fontSize: 20,
    color: DefaultColors.primaryColor,
    fontWeight: FontWeight.bold,
  );

  static const candyDescriptionLabel = TextStyle(
    fontSize: 21,
    color: Colors.black87,
    fontWeight: FontWeight.bold,
  );

  static const candyDescription = TextStyle(
    fontSize: 18,
    color: Colors.black87,
    fontWeight: FontWeight.normal,
  );
  static const allergeni = TextStyle(
    fontSize: 14,
    color: Colors.white,
    fontWeight: FontWeight.bold,
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

  static const morePrimaryTitle = TextStyle(
    fontSize: 20,
    color: DefaultColors.primaryColor,
    fontWeight: FontWeight.bold,
  );

  static const moreSecondaryTitle = TextStyle(
    fontSize: 20,
    color: DefaultColors.dividerColor,
    fontWeight: FontWeight.bold,
  );

  static const homeSubtitle = TextStyle(
    fontSize: 18,
    color: Colors.white,
    fontWeight: FontWeight.normal,
  );
}

class DefaultBorders {
  static const candyContainer = BorderRadius.only(
    topLeft: Radius.circular(18),
    topRight: Radius.circular(18),
  );
  static final categoryContainer = BorderRadius.circular(8);
  static final allergeniContainer = BorderRadius.circular(10);
  static final candyPrice = BorderRadius.circular(4);
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
  static const categoryContainerInt = EdgeInsets.only(right: 0);
  static const backButton = EdgeInsets.all(6);
  static candyContainerExt({bool right = false, bool left = false}) =>
      EdgeInsets.only(
        left: left ? 15 : 10,
        right: right ? 15 : 10,
        top: 5,
        bottom: 5,
      );
  static const candyContainerInt = EdgeInsets.only(
    left: 20,
    top: 5,
    bottom: 15,
    right: 5,
  );
  static const candyDescription = EdgeInsets.only(
    left: 50,
    right: 50,
    bottom: 20,
    top: 5,
  );
  static const candyDescriptionLabel = EdgeInsets.only(
    left: 50,
    right: 50,
    top: 50,
    bottom: 15,
  );
  static const candyTitleLabel = EdgeInsets.only(
    left: 25,
    right: 25,
    top: 0,
    bottom: 15,
  );
  static const candyPriceLabel = EdgeInsets.symmetric(
    horizontal: 10,
    vertical: 1,
  );

  static const moreRightOnly = EdgeInsets.only(right: 20);
  static const moreRightOnlySocials = EdgeInsets.only(right: 22);
  static const allergeniInside = EdgeInsets.all(8.0);
}

class StaticImages {
  static const String defaultCandy =
      "https://www.planetcandy.ie/image/cache/catalog/Placeholders/chocolate-sweets-placeholder-300x300.jpg";
}

class DefaultColors {
  static const Color primaryColor = Color(0xffc99d66);

  static const Color secondaryColor = Color(0xff422918);

  static const Color dividerColor = Color(0xffa3897a);
}
