import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:pasticceria/constants/constants.dart';
import 'package:pasticceria/screens/auth/controllers/auth_controller.dart';
import 'package:pasticceria/screens/home/controllers/links_controller.dart';
import 'package:pasticceria/widgets/more_page_button.dart';

class MoreScreen extends GetView<AuthController> {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(
          () => ListView(
            shrinkWrap: true,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Image.asset(
                  'assets/logo/fantasie-512.png',
                  color: const Color(0xffc99d66),
                  height: Get.size.height / 4,
                ),
              ),
              SizedBox(height: Get.size.height / 10),
              MorePageButton(
                text: "NEGOZIO",
                onPressed: () => Get.toNamed('/about-us'),
              ),
              if (controller.firebaseUser.value == null)
                const SizedBox(height: 5),
              if (controller.firebaseUser.value == null)
                MorePageButton(
                  text: "ADMIN LOGIN",
                  onPressed: () => Get.toNamed('/login'),
                ),
              const SizedBox(height: 5),
              MorePageButton(
                text: "TERMINI & CONDIZIONI",
                onPressed: () => Get.toNamed('/terms', arguments: 'terms'),
                primary: false,
              ),
              const SizedBox(height: 5),
              MorePageButton(
                text: "PRIVACY POLICY",
                onPressed: () => Get.toNamed('/terms', arguments: 'privacy'),
                primary: false,
              ),
              SizedBox(height: Get.size.height / 18),
              _buildWebPhoneEmail(),
              const SizedBox(height: 30),
              _buildSocials(),
              const SizedBox(height: 40),
              if (controller.firebaseUser.value != null)
                ListTile(
                  leading: const Icon(Icons.logout_rounded),
                  title: const Text("Logout"),
                  onTap: () async {
                    await AuthController.instance.logout();
                    Get.offAllNamed('/');
                  },
                ),
              if (controller.firebaseUser.value != null) const Divider(),
              if (controller.firebaseUser.value != null)
                ListTile(
                  leading: const Icon(CupertinoIcons.add_circled),
                  title: const Text("Gestisci Categorie"),
                  onTap: () => Get.toNamed('/categories'),
                ),
              if (controller.firebaseUser.value != null) const Divider(),
              if (controller.firebaseUser.value != null)
                ListTile(
                  leading: const Icon(CupertinoIcons.add_circled),
                  title: const Text("Gestisci Dolci"),
                  onTap: () => Get.toNamed('/candies'),
                ),
            ],
          ),
        ),
      ),
    );
  }

  _buildWebPhoneEmail() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () async => await LinksController.to.openWebsite(),
          child: const Padding(
            padding: BestPaddings.moreRightOnly,
            child: Icon(
              Icons.language_outlined,
              size: 45,
            ),
          ),
        ),
        GestureDetector(
          onTap: () async => await LinksController.to.openPhone(),
          child: const Padding(
            padding: BestPaddings.moreRightOnly,
            child: Icon(
              Icons.phone,
              size: 45,
            ),
          ),
        ),
        GestureDetector(
          onTap: () async => await LinksController.to.openEmail(),
          child: const Padding(
            padding: BestPaddings.moreRightOnly,
            child: Icon(
              Icons.email_outlined,
              size: 45,
            ),
          ),
        ),
      ],
    );
  }

  _buildSocials() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () async => await LinksController.to.openFacebook(),
          child: const Padding(
            padding: BestPaddings.moreRightOnlySocials,
            child: FaIcon(
              FontAwesomeIcons.facebook,
              color: DefaultColors.primaryColor,
              size: 45,
            ),
          ),
        ),
        GestureDetector(
          onTap: () async => await LinksController.to.openInstagram(),
          child: const Padding(
            padding: BestPaddings.moreRightOnlySocials,
            child: FaIcon(
              FontAwesomeIcons.instagram,
              color: DefaultColors.primaryColor,
              size: 45,
            ),
          ),
        ),
        GestureDetector(
          onTap: () async => await LinksController.to.openWhatsapp(),
          child: const Padding(
            padding: BestPaddings.moreRightOnlySocials,
            child: FaIcon(
              FontAwesomeIcons.whatsapp,
              color: DefaultColors.primaryColor,
              size: 45,
            ),
          ),
        ),
      ],
    );
  }
}
