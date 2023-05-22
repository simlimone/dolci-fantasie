import 'package:get/get.dart';
import 'package:pasticceria/constants/constants.dart';
import 'package:pasticceria/models/candy.dart';
import 'package:pasticceria/models/category.dart';

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

  Future<List<Candy>> getCandyByCategory(Category category) async {
    var doc = await Strings.candyInCategoryCollection(category.id).get();

    return doc.docs.map((e) => Candy.fromMap(e.data())).toList();
  }

  Future<List<Candy>> getCandyBySearch(String search) async {
    List<Candy> returnList = [];
    return returnList;
  }
}
