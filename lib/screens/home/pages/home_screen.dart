import 'package:flutter/material.dart';
import 'package:pasticceria/constants/constants.dart';
import 'package:pasticceria/screens/home/controllers/links_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            color: Colors.grey,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              _buildWebPhoneEmail(),
              Image.asset(
                "assets/logo/fantasie-512-white.png",
                color: Colors.white,
                height: 250,
              ),
              const Text(
                "BENVENUTI\nIN UN MONDO\nDI BONTÀ",
                textAlign: TextAlign.center,
                style: TextStyles.homeSubtitle,
              ),
            ],
          )
        ],
      ),
    );
  }

  _buildWebPhoneEmail() {
    return Padding(
      padding: const EdgeInsets.only(top: 50.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () async => await LinksController.to.openWebsite(),
            child: const Padding(
              padding: BestPaddings.moreRightOnly,
              child: Icon(
                Icons.language_outlined,
                color: Colors.white,
                size: 25,
              ),
            ),
          ),
          GestureDetector(
            onTap: () async => await LinksController.to.openPhone(),
            child: const Padding(
              padding: BestPaddings.moreRightOnly,
              child: Icon(
                Icons.phone,
                color: Colors.white,
                size: 25,
              ),
            ),
          ),
          GestureDetector(
            onTap: () async => await LinksController.to.openEmail(),
            child: const Padding(
              padding: BestPaddings.moreRightOnly,
              child: Icon(
                Icons.email_outlined,
                color: Colors.white,
                size: 25,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
