import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pasticceria/screens/auth/controllers/auth_controller.dart';

class MoreScreen extends GetView<AuthController> {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/logo/fantasie-256.png',
          color: Colors.white,
          height: 100,
        ),
      ),
      body: SafeArea(
        child: Obx(
          () => ListView(
            children: [
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
              ListTile(
                leading: const Icon(CupertinoIcons.question_circle),
                title: const Text("CHI SIAMO"),
                onTap: () => Get.toNamed('/about-us'),
              ),
              const Divider(),
              const ListTile(
                leading: Icon(CupertinoIcons.doc_richtext),
                title: Text("Termini di Servizio"),
              ),
              const Divider(),
              const ListTile(
                leading: Icon(CupertinoIcons.doc_richtext),
                title: Text("Politica sulla Privacy"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
