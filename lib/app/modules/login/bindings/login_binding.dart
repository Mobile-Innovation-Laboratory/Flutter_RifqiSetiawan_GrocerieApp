import 'package:get/get.dart';
import 'package:tubes_motion/app/data/services/auth_controller.dart';

import '../controllers/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(
      () => AuthController(),
    );
    Get.lazyPut<LoginController>(
      () => LoginController(),
    );
  }
}
