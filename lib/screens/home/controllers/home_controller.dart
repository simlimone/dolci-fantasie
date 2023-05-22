import 'package:get/get.dart';
import 'package:pasticceria/constants/constants.dart';
import 'package:pasticceria/models/category.dart';

class HomeController extends GetxController {
  static final to = Get.find<HomeController>();

  RxList<Category> categories = <Category>[].obs;

  @override
  void onReady() async {
    await setCategories();
    super.onReady();
  }

  Future<void> setCategories() async {
    categories.clear();
    categories.addAll(await getCategories());
    update();
  }

  Future<List<Category>> getCategories() async {
    var doc = await Strings.categoriesCollection.get();
    return doc.docs.map((e) => Category.fromMap(e.data())).toList();
  }
}
