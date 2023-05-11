import 'package:get/get.dart';
import 'package:pasticceria/bindings/about_us_binding.dart';
import 'package:pasticceria/bindings/auth_binding.dart';
import 'package:pasticceria/bindings/candies_binding.dart';
import 'package:pasticceria/bindings/candy_list_binding.dart';
import 'package:pasticceria/bindings/categories_binding.dart';
import 'package:pasticceria/bindings/edit_candy_detail_binding.dart';
import 'package:pasticceria/bindings/home_binding.dart';
import 'package:pasticceria/screens/about-us/about_page.dart';
import 'package:pasticceria/screens/admin/candies/candies_page.dart';
import 'package:pasticceria/screens/admin/candies/edit-candy/edit_candy_detail_page.dart';
import 'package:pasticceria/screens/auth/login_page.dart';
import 'package:pasticceria/screens/candy/candy_list.dart';
import 'package:pasticceria/screens/candy/details/candy_detail.dart';
import 'package:pasticceria/screens/admin/categories/categories_page.dart';
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
    GetPage(
      name: '/candy-detail',
      page: () => const CandyDetailPage(),
    ),
    GetPage(
      name: '/edit-candy-detail',
      page: () => const EditCandyDetailPage(),
      binding: EditCandyDetailBinding(),
    ),
    GetPage(
      name: '/about-us',
      page: () => const AboutUsPage(),
      binding: AboutUsBinding(),
    ),
    GetPage(
      name: '/categories',
      page: () => const CategoriesPage(),
      binding: CategoriesBinding(),
    ),
    GetPage(
      name: '/candies',
      page: () => const CandiesPage(),
      binding: CandiesBinding(),
    ),
  ];
}
