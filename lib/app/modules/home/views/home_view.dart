import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tubes_motion/app/routes/app_pages.dart';
import 'package:tubes_motion/app/widgets/button.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              "assets/images/gambarAwal.png",
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 380), 
                Image.asset("assets/images/wortel.png"),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Welcome \nto our store",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    height: 0.9,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Get your groceries in as fast as one hour",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Button(
                  title: "Get Started",
                  onPressed: (){
                    Get.toNamed(Routes.LOGIN);
                },),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
