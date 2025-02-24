import 'package:get/get.dart';

import '../controller/basic_settings/splash_controller.dart';


class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SplashController());
  }
}
