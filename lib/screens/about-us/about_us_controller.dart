import 'package:get/get.dart';
import 'package:pasticceria/constants/constants.dart';
import 'package:pasticceria/models/about.dart';

class AboutUsController extends GetxController {
  static final to = Get.find<AboutUsController>();

  Rxn<About> about = Rxn<About>();

  @override
  void onReady() async {
    about.value = await setupAbout();
    update();
    super.onReady();
  }

  Future<About?> setupAbout() async {
    var doc = await Strings.aboutDocument.get();

    if (doc.exists) {
      return About.fromMap(doc.data()!);
    }

    return null;
  }
}
