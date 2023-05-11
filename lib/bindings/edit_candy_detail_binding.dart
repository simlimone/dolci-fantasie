import 'package:get/get.dart';
import 'package:pasticceria/screens/admin/candies/controllers/edit_candy_detail_controller.dart';

class EditCandyDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EditCandyDetailController());
  }
}
