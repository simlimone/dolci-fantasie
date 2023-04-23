import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:pasticceria/constants/constants.dart';
import 'package:pasticceria/models/candy.dart';

class CandyListController extends GetxController {
  static final to = Get.find<CandyListController>();

  RxList<Candy> candyList = <Candy>[].obs;

  @override
  void onReady() async {
    await setCandyList();
    super.onReady();
  }

  Future<void> setCandyList() async {
    Map<String, dynamic> argument = Get.arguments;

    if (argument.keys.contains('category')) {
      candyList.clear();
      candyList.addAll(await getCandyByCategory(argument['category']));
    }

    if (argument.keys.contains('search')) {
      candyList.clear();
      candyList.addAll(await getCandyBySearch(argument['search']));
    }

    update();
  }

  Future<List<Candy>> getCandyByCategory(String category) async {
    List<Candy> returnList = [];

    var categories = await Strings.categoriesDocument.get();
    int categoryNumber =
        (categories.get('list') as List<dynamic>).indexOf(category);

    var docsFoundByCategory = await Strings.candyCollection
        .where('category', isEqualTo: categoryNumber)
        .get();

    returnList
        .addAll(docsFoundByCategory.docs.map((e) => Candy.fromMap(e.data())));

    return returnList;
  }

  Future<List<Candy>> getCandyBySearch(String search) async {
    List<Candy> returnList = [];
    return returnList;
  }
}
