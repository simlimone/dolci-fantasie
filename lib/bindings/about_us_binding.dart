import 'package:get/get.dart';
import 'package:pasticceria/screens/about-us/about_us_controller.dart';

class AboutUsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AboutUsController());
  }
}
