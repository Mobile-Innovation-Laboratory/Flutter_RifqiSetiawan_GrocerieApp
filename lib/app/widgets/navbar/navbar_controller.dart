import 'package:get/get.dart';
import 'package:tubes_motion/app/routes/app_pages.dart';

class NavbarController extends GetxController {
  var selectedIndex = 0.obs; 

  void changeIndex(int index) {
    selectedIndex.value = index;
      switch (index) {
      case 0:
        Get.toNamed(Routes.DASHBOARD);
        break;
      case 1:
         Get.toNamed(Routes.EXPLORE);
        break;
      case 2:
         Get.toNamed(Routes.CART);
        break;
      case 3:
         Get.toNamed(Routes.FAVORITE);
        break;
      case 4:
         Get.toNamed(Routes.ACCOUNT);
        break;
    }
  }

  
}
