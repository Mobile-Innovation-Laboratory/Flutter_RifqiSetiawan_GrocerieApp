import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  //TODO: Implement DashboardController
  var currentIndex = 0.obs;
  TextEditingController searchInput = TextEditingController();
  final List<String> imageList = [
    'assets/images/banner1.png',
    'assets/images/banner1.png',
    'assets/images/banner1.png',
  ];
    CarouselSliderController buttonCarouselController = CarouselSliderController();
  
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
    void updateIndex(int index) {
    currentIndex.value = index;
  }
}
