import 'package:get/get.dart';
import 'package:ultimate_task/viewmodels/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
  }
}
