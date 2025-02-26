import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tubes_motion/app/widgets/button_widget.dart';

import '../controllers/detail_grocerie_controller.dart';

class DetailGrocerieView extends GetView<DetailGrocerieController> {
  const DetailGrocerieView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image Section
            Center(
              child: Image.network(
                controller.grocerie.thumbnail ?? "",
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 10),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    controller.grocerie.title ?? "",
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Icon(Icons.favorite_border),
                ],
              ),
            ),
            const SizedBox(height: 5),

            // Weight & Price
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text("1kg, Price", style: TextStyle(color: Colors.grey)),
            ),
            const SizedBox(height: 10),

            // Quantity & Price
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Quantity Selector
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.remove,
                          size: 25,
                          color: Color(0xffB3B3B3),
                        ),
                        onPressed: () {},
                      ),
                      SizedBox(
                        width: 7,
                      ),
                      const Text("1"),
                      SizedBox(
                        width: 7,
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.add,
                          color: Color(0xff53B175),
                          size: 25,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  // Price
                  const Text(
                    "\$4.99",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),

            // Product Detail
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ExpansionTile(
                tilePadding: EdgeInsets.zero,
                childrenPadding: const EdgeInsets.symmetric(horizontal: 16),
                collapsedShape: const RoundedRectangleBorder(
                  side: BorderSide(color: Colors.transparent),
                ),
                shape: const RoundedRectangleBorder(
                  side: BorderSide(color: Colors.transparent),
                ),
                backgroundColor: Colors.transparent,
                collapsedBackgroundColor: Colors.transparent,
                title: Text(
                  "Product Detail",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                children: [
                  Text(
                    '${controller.grocerie.description ?? ""}',
                    style: TextStyle(
                      fontSize: 13,
                      color: Color(0xff7C7C7C),
                    ),
                  ),
                ],
              ),
            ),

            // Nutritions
            const ListTile(
              title: Text(
                "Nutritions",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
              trailing: Text("100g >"),
            ),

            // Review
            const ListTile(
              title: Text("Review"),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.star, color: Colors.orange),
                  Icon(Icons.star, color: Colors.orange),
                  Icon(Icons.star, color: Colors.orange),
                  Icon(Icons.star, color: Colors.orange),
                  Icon(Icons.star_border, color: Colors.orange),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Button
            Center(
              child: Button(
                title: "Add To Basket",
                onPressed: () {},
              ),
            )
          ],
        ),
      ),
    );
  }
}
