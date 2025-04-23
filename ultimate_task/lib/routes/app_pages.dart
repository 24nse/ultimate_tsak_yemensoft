import 'package:get/get.dart';
import 'package:ultimate_task/bindings/home_binding.dart';
import 'package:ultimate_task/views/home_screen.dart';
import 'package:ultimate_task/views/login/login_screen.dart';
import '../bindings/login_binding.dart';

class AppRoutes {
  static const String login = '/login';
  static const String home = '/home';

  static final routes = [
    GetPage(
      name: login,
      page: () => LoginScreen(),
      binding: LoginBinding(),
    ),
       GetPage(
      name: AppRoutes.home,
       page: () =>  HomeScreen(),
      binding: HomeBinding(),
    ),
  ];
}
