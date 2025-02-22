import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tubes_motion/app/widgets/navbar/custom_navbar.dart';

import '../controllers/favorite_controller.dart';

class FavoriteView extends GetView<FavoriteController> {
  const FavoriteView({super.key});
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(child: Text("Home")),
      bottomNavigationBar: CustomNavbar(),
    );
  }
}
