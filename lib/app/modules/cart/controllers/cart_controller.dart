import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  //TODO: Implement CartController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> addToCart(
      String userId, Map<String, dynamic> grocerie, int quantity) async {
    final cartRef = FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('cart');

    await cartRef.doc(grocerie['id'].toString()).set({
      'id': grocerie['id'],
      'title': grocerie['title'],
      'price': grocerie['price'],
      'quantity': quantity,
      'totalPrice': grocerie['price'] * quantity,
      'thumbnail': grocerie['thumbnail'],
    });
  }
}
