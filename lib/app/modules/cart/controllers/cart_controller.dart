import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  var totalPrice = 0.0.obs;
  var cartItems = [].obs;
  String? uid = FirebaseAuth.instance.currentUser?.uid;
  var isLoading = false.obs;
  @override
  void onInit() {
    super.onInit();
    fetchCartItems();
    ever(cartItems, (_) {
      fetchCartItems();
      calculateTotalPrice();
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
  void calculateTotalPrice() {
    double total = 0.0;
    for (var item in cartItems) {
      total += (item["quantity"] * item["price"]);
    }
    totalPrice.value = double.parse(total.toStringAsFixed(2));
  }

  Future<void> fetchCartItems() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        String userId = user.uid;
        QuerySnapshot cartSnapshot = await FirebaseFirestore.instance
            .collection("users")
            .doc(userId)
            .collection("cart")
            .get();

        cartItems.value = cartSnapshot.docs.map((doc) {
          return {
            "grocerieId": doc["grocerieId"],
            "image": doc["image"],
            "price": doc["price"],
            "quantity": doc["quantity"],
            "title": doc["title"],
          };
        }).toList();
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

  Future<void> minusItemFromCart(int grocerieId) async {
    try {
      if (uid != null) {
        QuerySnapshot querySnapshot = await FirebaseFirestore.instance
            .collection('users')
            .doc(uid)
            .collection('cart')
            .where('grocerieId', isEqualTo: grocerieId)
            .get();

        if (querySnapshot.docs.isNotEmpty) {
          DocumentSnapshot doc = querySnapshot.docs.first;
          int currentQuantity = doc['quantity'];

          if (currentQuantity > 1) {
            await FirebaseFirestore.instance
                .collection('users')
                .doc(uid)
                .collection('cart')
                .doc(doc.id)
                .update({'quantity': currentQuantity - 1});
          } else {
            await deleteItemFromCart(grocerieId);
          }
        }
      } else {
        Get.snackbar("Error", "Pengguna tidak login.");
      }
    } catch (e) {
      Get.snackbar("Error", "Gagal mengurangi item: ${e.toString()}");
    }
  }

  Future<void> deleteItemFromCart(int grocerieId) async {
    try {
      if (uid != null) {
        QuerySnapshot querySnapshot = await FirebaseFirestore.instance
            .collection('users')
            .doc(uid)
            .collection('cart')
            .where('grocerieId', isEqualTo: grocerieId)
            .get();

        for (var doc in querySnapshot.docs) {
          await FirebaseFirestore.instance
              .collection('users')
              .doc(uid)
              .collection('cart')
              .doc(doc.id)
              .delete();
        }

        Get.snackbar("Success", "Item berhasil dihapus dari keranjang.");
      } else {
        Get.snackbar("Error", "Pengguna tidak login.");
      }
    } catch (e) {
      Get.snackbar("Error", "Gagal menghapus item: ${e.toString()}");
    }
  }
}
