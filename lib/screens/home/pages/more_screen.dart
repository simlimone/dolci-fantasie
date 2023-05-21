import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pasticceria/screens/auth/controllers/auth_controller.dart';

class MoreScreen extends GetView<AuthController> {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(
          () => ListView(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Image.asset(
                  'assets/logo/fantasie-512.png',
                  color: Colors.white,
                  fit: BoxFit.fitWidth,
                ),
              ),
              controller.firebaseUser.value != null
                  ? ListTile(
                      leading: const Icon(Icons.logout_rounded),
                      title: const Text("Logout"),
                      onTap: () async {
                        await AuthController.instance.logout();
                        Get.offAllNamed('/');
                      },
                    )
                  : ListTile(
                      leading: const Icon(CupertinoIcons.building_2_fill),
                      title: const Text("Admin Login"),
                      onTap: () => Get.toNamed('/login'),
                    ),
              const Divider(),
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
              if (controller.firebaseUser.value != null) const Divider(),
              ListTile(
                leading: const Icon(CupertinoIcons.question_circle),
                title: const Text("CHI SIAMO"),
                onTap: () => Get.toNamed('/about-us'),
              ),
              const Divider(),
              ListTile(
                leading: const Icon(CupertinoIcons.doc_richtext),
                title: const Text("Termini di Servizio"),
                onTap: () => Get.toNamed('/terms', arguments: 'terms'),
              ),
              const Divider(),
              ListTile(
                leading: const Icon(CupertinoIcons.doc_richtext),
                title: const Text("Politica sulla Privacy"),
                onTap: () => Get.toNamed('/terms', arguments: 'privacy'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
