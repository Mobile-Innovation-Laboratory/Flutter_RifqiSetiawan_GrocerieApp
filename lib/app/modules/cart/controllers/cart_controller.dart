import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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

  Future<void> addItemToCart(Map<String, dynamic> itemData) async {
  try {
    String? uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid != null) {
      int grocerieId = itemData['grocerieId']; 
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .collection('cart')
          .where('grocerieId', isEqualTo: grocerieId)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        DocumentSnapshot doc = querySnapshot.docs.first;
        int currentQuantity = doc['quantity'];
        int newQuantity = currentQuantity + 1;

        await FirebaseFirestore.instance
            .collection('users')
            .doc(uid)
            .collection('cart')
            .doc(doc.id)
            .update({'quantity': newQuantity});
      } else {
        await FirebaseFirestore.instance
            .collection('users')
            .doc(uid)
            .collection('cart')
            .add(itemData);
      }
    } else {
      Get.snackbar("Error", "Pengguna tidak login.");
    }
  } catch (e) {
    Get.snackbar("Error", "Gagal menambahkan item ke keranjang: ${e.toString()}");
  }
}

  Future<bool> isGrocerieIdInCart(int grocerieId) async {
  try {
    String? uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid != null) {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .collection('cart')
          .where('grocerieId', isEqualTo: grocerieId)
          .get();
      return querySnapshot.docs.isNotEmpty;
    } else {
      Get.snackbar("Error", "Pengguna tidak login.");
      return false;
    }
  } catch (e) {
    Get.snackbar("Error", "Gagal memeriksa keranjang: ${e.toString()}");
    return false;
  }
}
}
