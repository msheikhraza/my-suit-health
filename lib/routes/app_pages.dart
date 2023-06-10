import 'package:get/get.dart';
import 'package:razasheikhtest/modules/bottom_navigation/bottom_nav.dart';
import 'package:razasheikhtest/modules/login/view/login_view.dart';
import 'package:razasheikhtest/modules/products/binding/dashboard_binding.dart';
import 'package:razasheikhtest/modules/products/view/product_details.dart';
import 'package:razasheikhtest/routes/app_routes.dart';


class AppPages {
  static final routes = [
    GetPage(
      name: Routes.loginScreen,
      page: () =>  LoginView(),
    ),
    GetPage(
      name: Routes.homeScreen,
      binding: DashBoardBinding(),
      page: () =>  const BottomNavigationHomeView(),
    ),
    GetPage(
      name: Routes.productDetailScreen,
      page: () =>  const ProductDetails(),
    ),
  ];
}
