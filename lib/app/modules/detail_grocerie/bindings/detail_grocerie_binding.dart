import 'package:get/get.dart';

import '../controllers/detail_grocerie_controller.dart';

class DetailGrocerieBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailGrocerieController>(
      () => DetailGrocerieController(),
    );
  }
}
