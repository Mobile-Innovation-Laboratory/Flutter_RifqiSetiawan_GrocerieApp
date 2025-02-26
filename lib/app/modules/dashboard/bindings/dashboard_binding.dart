import 'package:get/get.dart';
import 'package:tubes_motion/app/modules/cart/controllers/cart_controller.dart';

import '../controllers/dashboard_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(
      () => DashboardController(),
    );
    Get.lazyPut<CartController>(
      () => CartController(),
    );
  }
}
