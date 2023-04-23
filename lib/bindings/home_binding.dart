import 'package:get/get.dart';
import 'package:pasticceria/screens/home/controllers/home_controller.dart';
import 'package:pasticceria/screens/home/controllers/root_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RootMenuController());
    Get.lazyPut(() => HomeController());
  }
}
