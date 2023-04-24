import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            ListTile(
              leading: const Icon(CupertinoIcons.building_2_fill),
              title: const Text("Admin Login"),
              onTap: () => Get.toNamed('/login'),
            ),
            const Divider(),
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
    );
  }
}
