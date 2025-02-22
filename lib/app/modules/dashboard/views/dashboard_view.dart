import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tubes_motion/app/widgets/navbar/custom_navbar.dart';
import 'package:tubes_motion/app/widgets/search_bar_widget.dart';

import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 50,
          ),
          Image.asset('assets/images/wortelColour.png'),
          SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.location_pin,
                color: Color(0xff4C4F4D),
              ),
              Text(
                "Bojongsoang, Bandung",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff4C4F4D)),
              ),
            ],
          ),
          SizedBox(height: 15,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: SearchBarWidget(controller: controller.searchInput, hintText: "Search Store",),
          ),
          SizedBox(height: 20,),
          
        ],
      )),
      bottomNavigationBar: CustomNavbar(),
    );
  }
}
