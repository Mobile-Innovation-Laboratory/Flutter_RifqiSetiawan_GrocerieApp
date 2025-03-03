import 'package:get/get.dart';
import 'package:tubes_motion/app/data/services/auth_controller.dart';

import '../controllers/register_controller.dart';

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterController>(
      () => RegisterController(),
    );
    Get.lazyPut<AuthController>(
      () => AuthController(),
    );
  }
}
