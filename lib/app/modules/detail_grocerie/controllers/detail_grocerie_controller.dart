import 'package:get/get.dart';
import 'package:tubes_motion/app/data/models/groceries_model.dart';

class DetailGrocerieController extends GetxController {
  //TODO: Implement DetailGrocerieController
  late final GroceriesModel grocerie;
  final count = 0.obs;
  var tes = "hja";
  @override
  void onInit() {
    super.onInit();

    if (Get.arguments != null && Get.arguments is Map<String, dynamic>) {
      final args = Get.arguments as Map<String, dynamic>;

      if (args.containsKey('grocerie') && args['grocerie'] is GroceriesModel) {
        grocerie = args['grocerie'];
        print("✅ Data grocerie berhasil diterima: $grocerie");
      } else {
        print("⚠️ Argument 'grocerie' tidak ditemukan atau tipe tidak sesuai.");
      }
    } else {
      print("⚠️ Tidak ada arguments yang diterima atau bukan Map.");
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
