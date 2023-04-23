import 'package:get/get.dart';
import 'package:pasticceria/screens/candy/controllers/candy_list_controller.dart';

class CandyListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CandyListController());
  }
}
