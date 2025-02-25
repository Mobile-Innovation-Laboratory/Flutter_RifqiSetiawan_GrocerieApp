import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:tubes_motion/app/widgets/navbar/custom_navbar.dart';
import 'package:tubes_motion/app/widgets/search_bar_widget.dart';

import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(
      init: DashboardController(),
      builder: (context) {
        return Obx(() => controller.isLoading.value
            ? Material(
                child: Center(child: CircularProgressIndicator()),
              )
            : Scaffold(
                body: SafeArea(
                  child: Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(height: 50),
                            Image.asset('assets/images/wortelColour.png'),
                            SizedBox(height: 8),
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
                            SizedBox(height: 20),
                            SearchBarWidget(
                              controller: controller.searchInput,
                              hintText: "Search Store",
                            ),
                            SizedBox(height: 20),
                            CarouselSlider(
                              items: controller.imageList.map((imageUrl) {
                                return Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(imageUrl),
                                        fit: BoxFit.cover),
                                  ),
                                );
                              }).toList(),
                              options: CarouselOptions(
                                height: 100,
                                aspectRatio: 16 / 9,
                                autoPlay: true,
                                enlargeCenterPage: true,
                                enlargeFactor: 0.3,
                                onPageChanged: (index, reason) {
                                  controller.updateIndex(index);
                                },
                                scrollDirection: Axis.horizontal,
                              ),
                            ),
                            SizedBox(height: 30),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Exclusive Offer",
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  "See all",
                                  style: TextStyle(
                                    color: Color(0xff53B175),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 20),
                            SizedBox(
                              height: 240,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: controller.excGroceries.length,
                                itemBuilder: (context, index) {
                                  final currExcGroceries =
                                      controller.excGroceries[index];
                                  return Container(
                                    height: 150,
                                    width: 200,
                                    margin: EdgeInsets.only(right: 16),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16),
                                      border: Border.all(
                                        color: Color(0xffE2E2E2),
                                        width: 1,
                                      ),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: 150,
                                          height: 150,
                                          child: Center(
                                            child: Image.network(
                                              currExcGroceries.thumbnail ?? "",
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          currExcGroceries.title ?? "",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          '${currExcGroceries.stock ?? 0}, Priceg',
                                          style: TextStyle(
                                            color: Color(0xff7C7C7C),
                                            fontSize: 14,
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                bottomNavigationBar:
                    CustomNavbar(), // Navbar will stay at the bottom
              ));
      },
    );
  }
}
