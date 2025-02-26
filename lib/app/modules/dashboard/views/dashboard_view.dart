import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:tubes_motion/app/routes/app_pages.dart';
import 'package:tubes_motion/app/widgets/container_groceries_widget.dart';
import 'package:tubes_motion/app/widgets/navbar/custom_navbar.dart';
import 'package:tubes_motion/app/widgets/search_bar_widget.dart';
import 'package:tubes_motion/app/widgets/text_dashboard.dart';

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
                            TextDashboard(text: "Exclusive Offer"),
                            SizedBox(height: 20),
                            // EXCLUSIVE GROCERIES START
                            SizedBox(
                              height: 260,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: controller.excGroceries.length,
                                itemBuilder: (context, index) {
                                  final currExcGroceries =
                                      controller.excGroceries[index];
                                  return GestureDetector(
                                    onTap: (){
                                      Get.toNamed(Routes.DETAIL_GROCERIE, arguments: {'grocerie' : currExcGroceries});
                                    },
                                    child: ContainerGroceriesWidget(
                                        title: currExcGroceries.title,
                                        thumbnail: currExcGroceries.thumbnail,
                                        stock: currExcGroceries.stock,
                                        price: currExcGroceries.price,
                                        onAddTap: () {}),
                                  );
                                },
                              ),
                            ),
                            // EXCLUSIVE GROCERIES END
                            SizedBox(
                              height: 25,
                            ),
                            Column(
                              children: [
                                TextDashboard(text: "Groceries"),
                                SizedBox(
                                  height: 25,
                                ),
                                // GROCERIES START
                                GridView.builder(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: controller.groceries.length,
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 15,
                                      mainAxisSpacing: 18,
                                      mainAxisExtent: 265,
                                    ),
                                    itemBuilder: (context, index) {
                                      var currentGrocerie =
                                          controller.groceries[index];
                                      return GestureDetector(
                                        onTap: (){
                                          Get.toNamed(Routes.DETAIL_GROCERIE, arguments: {'grocerie' : currentGrocerie});
                                        },
                                        child: ContainerGroceriesWidget(
                                            title: currentGrocerie.title,
                                            thumbnail: currentGrocerie.thumbnail,
                                            stock: currentGrocerie.stock,
                                            price: currentGrocerie.price,
                                            onAddTap: () {}),
                                      );
                                    }),
                                // GROCERIES END
                              ],
                            ),
                            SizedBox(
                              height: 50,
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
