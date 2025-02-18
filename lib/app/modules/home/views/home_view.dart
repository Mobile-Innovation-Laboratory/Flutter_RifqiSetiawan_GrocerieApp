import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tubes_motion/app/routes/app_pages.dart';
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
                GestureDetector(
                  onTap: (){
                    Get.toNamed(Routes.LOGIN);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xff53B175),
                      borderRadius: BorderRadius.circular(18)
                    ),
                    width: 350,
                    height: 60,
                    child: Center(
                      child: Text("Get Started",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
