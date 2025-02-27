import 'package:carousel_slider/carousel_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:tubes_motion/app/data/models/data_groceries_model.dart';
import 'package:tubes_motion/app/data/models/groceries_model.dart';
import 'package:tubes_motion/app/data/services/groceries_service.dart';
import 'package:tubes_motion/app/modules/cart/controllers/cart_controller.dart';

class DashboardController extends GetxController {
  var currentIndex = 0.obs;
  TextEditingController searchInput = TextEditingController();
  final List<String> imageList = [
    'assets/images/banner3.png',
    'assets/images/banner2.png',
    'assets/images/banner1.png',
  ];
  CarouselSliderController buttonCarouselController =
      CarouselSliderController();
  var grocerie = DataGroceriesModel().obs;
  var groceries = <GroceriesModel>[].obs;
  var isLoading = true.obs;
  var excGroceries = <GroceriesModel>[].obs;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final CartController cartController = Get.find();
  
  
  @override
  void onInit() {
    super.onInit();
    fetchGroceries();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void updateIndex(int index) {
    currentIndex.value = index;
  }

  void fetchGroceries() async {
    grocerie.value =
        await GroceriesService().getGroceries() ?? DataGroceriesModel();
    groceries.value = grocerie.value.products ?? [];
    excGroceries.value = groceries.sublist(0,3);
    isLoading.value = false;
  }
}
