import 'package:get/get.dart';
import 'package:pasticceria/bindings/auth_binding.dart';
import 'package:pasticceria/bindings/candy_list_binding.dart';
import 'package:pasticceria/bindings/home_binding.dart';
import 'package:pasticceria/screens/auth/login_page.dart';
import 'package:pasticceria/screens/candy/candy_list.dart';
import 'package:pasticceria/screens/home/rootpage.dart';

class Routes {
  static final list = [
    GetPage(
      name: '/',
      page: () => const RootPage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: '/login',
      page: () => const LoginPage(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: '/candy-list',
      page: () => const CandyListPage(),
      binding: CandyListBinding(),
    ),
  ];
}
