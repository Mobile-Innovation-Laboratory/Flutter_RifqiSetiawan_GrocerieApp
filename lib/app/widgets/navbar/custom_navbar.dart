import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tubes_motion/app/widgets/navbar/navbar_controller.dart';

class CustomNavbar extends StatelessWidget {
  final NavbarController navbarController = Get.put(NavbarController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => BottomNavigationBar(
          currentIndex: navbarController.selectedIndex.value,
          onTap: navbarController.changeIndex,
          selectedItemColor: Colors.green, 
          unselectedItemColor: Colors.grey, 
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.shopping_bag_outlined), label: "Shop"),
            BottomNavigationBarItem(icon: Icon(Icons.explore_outlined), label: "Explore"),
            BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_outlined), label: "Cart"),
            BottomNavigationBarItem(icon: Icon(Icons.favorite_outline), label: "Favourite"),
            BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: "Account"),
          ],
        ));
  }
}
