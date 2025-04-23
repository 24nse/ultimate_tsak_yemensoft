import 'package:get/get.dart';
import 'package:ultimate_task/viewmodels/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
  }
}
