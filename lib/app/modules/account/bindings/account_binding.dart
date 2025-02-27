import 'package:get/get.dart';
import 'package:tubes_motion/app/data/services/auth_controller.dart';

import '../controllers/account_controller.dart';

class AccountBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AccountController>(
      () => AccountController(),
    );
    Get.lazyPut<AuthController>(
      () => AuthController(),
    );
  }
}
