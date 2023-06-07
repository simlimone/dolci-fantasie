import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:pasticceria/constants/constants.dart';
import 'package:pasticceria/models/links_model.dart';
import 'package:url_launcher/url_launcher.dart';

class LinksController extends GetxController {
  static final to = Get.find<LinksController>();

  final Rxn<Links> globalLinks = Rxn<Links>();

  @override
  void onReady() async {
    globalLinks.value = await getGlobalLinks();
  }

  Future<Links?> getGlobalLinks() async {
    DocumentSnapshot<Map<String, dynamic>> doc =
        await Strings.linksDocument.get();

    if (doc.exists && doc.data() != null) {
      return Links.fromMap(doc.data()!);
    }

    return null;
  }

  openFacebook() async {
    if (globalLinks.value?.facebook == null) {
      throw "Facebook is null";
    }

    final Uri url = Uri.parse(globalLinks.value!.facebook!);

    await _launchUrl(url);
  }

  openInstagram() async {
    if (globalLinks.value?.instagram == null) {
      throw "Instagram is null";
    }

    final Uri url = Uri.parse(globalLinks.value!.instagram!);

    await _launchUrl(url);
  }

  openWhatsapp() async {
    if (globalLinks.value?.whatsapp == null) {
      throw "Whatsapp is null";
    }

    final Uri url = Uri.parse(globalLinks.value!.whatsapp!);

    await _launchUrl(url);
  }

  openWebsite() async {
    if (globalLinks.value?.website == null) {
      throw "Website is null";
    }

    final Uri url = Uri.parse(globalLinks.value!.website!);

    await _launchUrl(url);
  }

  openEmail() async {
    if (globalLinks.value?.email == null) {
      throw "Email is null";
    }

    final Uri url = Uri.parse(globalLinks.value!.email!);

    await _launchUrl(url);
  }

  openPhone() async {
    if (globalLinks.value?.phoneNumber == null) {
      throw "Phone is null";
    }

    final Uri url = Uri.parse(globalLinks.value!.phoneNumber!);

    await _launchUrl(url);
  }

  Future<void> _launchUrl(Uri uri) async {
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $uri');
    }
  }
}
