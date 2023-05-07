import 'package:get/get.dart';
import 'package:pasticceria/screens/categories/controllers/categories_controller.dart';

class CategoriesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CategoriesController());
  }
}
