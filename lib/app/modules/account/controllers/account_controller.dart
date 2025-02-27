import 'package:cloud_firestore/cloud_firestore.dart';
    import 'package:firebase_auth/firebase_auth.dart';
    import 'package:get/get.dart';

    class AccountController extends GetxController {
      final FirebaseAuth auth = FirebaseAuth.instance;
      final FirebaseFirestore firestore = FirebaseFirestore.instance;
      var userData = <String, dynamic>{}.obs; 

      @override
      void onInit() {
        super.onInit();
        fetchUserData();
      }

      Future<void> fetchUserData() async {
        try {
          User? user = auth.currentUser;
          print("🔍 Current User: ${user?.uid ?? 'User belum login'}");

          if (user != null) {
            DocumentSnapshot userDoc =
                await firestore.collection('users').doc(user.uid).get();

            if (userDoc.exists) {
              print("✅ Data User dari Firestore: ${userDoc.data()}");
              userData.assignAll(userDoc.data() as Map<String, dynamic>);
            } else {
              print("⚠️ Data pengguna tidak ditemukan");
              Get.snackbar("Error", "Data pengguna tidak ditemukan");
            }
          } else {
            print("❌ Pengguna belum login");
            Get.snackbar("Error", "Pengguna belum login");
          }
        } catch (e) {
          print("🔥 Error mengambil data: ${e.toString()}");
          Get.snackbar("Error", "Gagal mengambil data pengguna: ${e.toString()}");
        }
      }
    }