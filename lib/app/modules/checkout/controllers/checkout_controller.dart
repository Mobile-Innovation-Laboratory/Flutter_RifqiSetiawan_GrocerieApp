import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class CheckoutController extends GetxController {
  //TODO: Implement CheckoutController
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  String? uid = FirebaseAuth.instance.currentUser?.uid;
  late Map<String, dynamic> data;
  @override
  void onInit() {
    super.onInit();
    data = Get.arguments ?? {};
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> addOrders() async {
    try {
      double totalPrice = data['totalPrice'].value;
      Map<String, dynamic> itemData = {
        'status' : data['status'],
        'total_price': totalPrice
      };

      await FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .collection('orders')
          .add(itemData);
    } catch (e) {
      Get.snackbar(
          "Error", "Gagal menambahkan item ke keranjang: ${e.toString()}");
    }
  }
}
