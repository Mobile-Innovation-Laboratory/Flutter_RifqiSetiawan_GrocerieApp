import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tubes_motion/app/widgets/navbar/custom_navbar.dart';

import '../controllers/cart_controller.dart';

class CartView extends GetView<CartController> {
  const CartView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My Cart",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      body: SafeArea(
          child: Column(
        children: [
          Container(
            width: 1, 
            color: Colors.grey, 
          ),
          ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: controller.cartItems.length,
            itemBuilder: (context, index) {
              var currenGrocerie = controller.cartItems[index];
              return Container(

              );
            }
          )
        ],
      )),
      bottomNavigationBar: CustomNavbar(),
    );
  }
}
