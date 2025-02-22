import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  //TODO: Implement DashboardController
  TextEditingController searchInput = TextEditingController();
  final List<String> imageList = [
    'assets/images/banner1.png',
    'https://source.unsplash.com/random/800x600?2',
    'https://source.unsplash.com/random/800x600?3',
    'https://source.unsplash.com/random/800x600?4',
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

}
