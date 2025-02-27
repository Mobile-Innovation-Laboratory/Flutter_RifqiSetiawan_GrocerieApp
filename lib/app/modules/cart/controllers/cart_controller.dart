import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  var cartItems = [].obs;
  String? uid = FirebaseAuth.instance.currentUser?.uid;
  @override
  void onInit() {
    super.onInit();
    fetchCartItems();
  }

  @override
  void onReady() {
    super.onReady();
    print("CartController is now ready!");
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> fetchCartItems() async {
    try {
      print("Fetching cart items...");
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        String userId = user.uid;
        QuerySnapshot cartSnapshot = await FirebaseFirestore.instance
            .collection("users")
            .doc(userId)
            .collection("cart")
            .get();

        print("Jumlah dokumen di Firestore: ${cartSnapshot.docs.length}");

        cartItems.value = cartSnapshot.docs.map((doc) {
          return {
            "grocerieId": doc["grocerieId"],
            "image": doc["image"],
            "price": doc["price"],
            "quantity": doc["quantity"],
            "title": doc["title"],
          };
        }).toList();

        print("Cart Items setelah fetch: ${cartItems.value}");
      } else {
        print("User belum login!");
      }
    } catch (e) {
      print("Error fetching cart items: $e");
    }
  }

  Future<void> addItemToCart(Map<String, dynamic> itemData) async {
    try {
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
      Get.snackbar(
          "Error", "Gagal menambahkan item ke keranjang: ${e.toString()}");
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
