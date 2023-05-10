import 'package:get/get.dart';
import 'package:pasticceria/screens/admin/candies/controllers/candies_controller.dart';

class CandiesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CandiesController());
  }
}
