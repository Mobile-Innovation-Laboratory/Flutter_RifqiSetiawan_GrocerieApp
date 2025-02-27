import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tubes_motion/app/routes/app_pages.dart';
import 'package:lottie/lottie.dart';
import 'package:tubes_motion/app/widgets/button_widget.dart';
import '../controllers/checkout_controller.dart';

class CheckoutView extends GetView<CheckoutController> {
  const CheckoutView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.white,
              Colors.grey[100]!,
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              'assets/lottie/checklist.json',
              width: double.infinity,
              height: 250
            ),
            SizedBox(height: 32),
            Text(
              'Your Order has been accepted',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Your items has been placed and is on it\'s way to being processed',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 48),
            Button(title: "Track Order"),
            SizedBox(height: 16),
            TextButton(
              onPressed: () {
                controller.addOrders();
                Get.toNamed(Routes.DASHBOARD);
              },
              child: Text('Back to home', style: 
              TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),),
            ),
          ],
        ),
      ),
    );
  }
}
