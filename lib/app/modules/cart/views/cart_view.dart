import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tubes_motion/app/widgets/button_add_minus.dart';
import 'package:tubes_motion/app/widgets/navbar/custom_navbar.dart';

import '../controllers/cart_controller.dart';

class CartView extends GetView<CartController> {
  const CartView({super.key});
  @override
  Widget build(BuildContext context) {
    controller.fetchCartItems();
    return GetBuilder<CartController>(
        init: CartController(),
        builder: (_) {
          return Obx(() => controller.isLoading.value
              ? const Material(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              : Scaffold(
                  body: SafeArea(
                      child: Column(
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      Center(
                        child: Text(
                          'My Cart',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Divider(
                        color: Color(0xffE2E2E2),
                        thickness: 2,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Expanded(
                          child: Obx(
                        () => ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: controller.cartItems.length,
                            itemBuilder: (context, index) {
                              var currenGrocerie = controller.cartItems[index];
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 25),
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                        color: Color(0xffE2E2E2),
                                        width: 2,
                                      ),
                                    ),
                                  ),
                                  margin: EdgeInsets.symmetric(vertical: 15),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 25, vertical: 15),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: 80,
                                        width: 80,
                                        child: Image.network(
                                          currenGrocerie['image'],
                                          width: double.infinity,
                                          fit: BoxFit.cover,
                                          height: 80,
                                        ),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            currenGrocerie['title'],
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            "1kg, Price",
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Color(0xff7C7C7C),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            children: [
                                              ButtonAddMinus(isAdd: false, onTap: ()=> controller.minusItemFromCart(currenGrocerie['grocerieId']),),
                                              SizedBox(
                                                width: 25,
                                              ),
                                              Text(
                                                  "${currenGrocerie['quantity']}"),
                                              SizedBox(
                                                width: 25,
                                              ),
                                              ButtonAddMinus(isAdd: true, onTap: () => controller.addItemToCart(currenGrocerie),),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          IconButton(
                                            onPressed: () => controller.deleteItemFromCart(currenGrocerie['grocerieId']),
                                            icon: Icon(Icons.close),
                                            color: Color(0xff7C7C7C),
                                            iconSize: 25,
                                          ),
                                          SizedBox(
                                            height: 45,
                                          ),
                                          Text(
                                            '\$${currenGrocerie['price'] * currenGrocerie['quantity']}',
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w800,
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              );
                            }),
                      ))
                    ],
                  )),
                  bottomNavigationBar: CustomNavbar(),
                ));
        });
  }
}
