import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pasticceria/bindings/initial_binding.dart';
import 'package:pasticceria/constants/routes_list.dart';
import 'package:pasticceria/constants/themes.dart';
import 'package:pasticceria/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Dolci Fantasie',
      theme: AppThemes.darkTheme,
      debugShowCheckedModeBanner: false,
      initialBinding: InitialBinding(),
      initialRoute: '/',
      getPages: Routes.list,
    );
  }
}
