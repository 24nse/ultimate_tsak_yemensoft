import 'package:get/get.dart';
import 'package:ultimate_task/views/login/login_screen.dart';



class AppPages {
  static const initial = Routes.login;

  static final routes = [
    GetPage(
      name: Routes.login,
      page: () => const LoginScreen(),
    ),
  
  ];
}


abstract class Routes {
  static const login = '/login';
}
