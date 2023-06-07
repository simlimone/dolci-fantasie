import 'package:get/get.dart';
import 'package:pasticceria/screens/auth/controllers/auth_controller.dart';
import 'package:pasticceria/screens/home/controllers/links_controller.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthController());
    Get.put(LinksController());
  }
}
