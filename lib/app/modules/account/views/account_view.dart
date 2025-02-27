import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tubes_motion/app/widgets/account_list_tile.dart';
import 'package:tubes_motion/app/widgets/navbar/custom_navbar.dart';

import '../controllers/account_controller.dart';

class AccountView extends GetView<AccountController> {
  const AccountView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AccountController>(
        init: AccountController(),
        builder: (_) {
          return Obx(
            () => Scaffold(
              body: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    SizedBox(height: 50,),
                    Row(
                      children: [
                        SizedBox(
                          height: 50,
                        ),
                        Container(
                          height: 60,
                          width: 60,
                          child: Image.asset("assets/images/wortelLogin.png"),
                          ),
                        SizedBox(width: 16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${controller.userData['username']}',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Text(controller.userData['email']),
                          ],
                        ),
                        Spacer(),
                        Icon(Icons.edit, size: 20),
                      ],
                    ),
                    SizedBox(height: 24),
                    AccountListTile(
                        title: 'Orders', icon: Icons.shopping_bag_outlined),
                    AccountListTile(
                        title: 'My Details', icon: Icons.person_outline),
                    AccountListTile(
                        title: 'Delivery Address',
                        icon: Icons.location_on_outlined),
                    AccountListTile(
                        title: 'Payment Methods', icon: Icons.payment_outlined),
                    AccountListTile(
                        title: 'Promo Cord', icon: Icons.discount_outlined),
                    AccountListTile(
                        title: 'Notifecations',
                        icon: Icons.notifications_outlined),
                    AccountListTile(title: 'Help', icon: Icons.help_outline),
                    AccountListTile(title: 'About', icon: Icons.info_outline),
                    SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: () => controller.authC.logout(),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.logout_outlined,
                            color: Color(0xff53B175),
                          ),
                          SizedBox(width: 8),
                          Text(
                            'Log Out',
                            style: TextStyle(
                              color: Color(0xff53B175),
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 245, 239, 239),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                          side: BorderSide(color: Colors.grey),
                        ),
                        minimumSize: Size(350, 60),
                      ),
                    ),
                  ],
                ),
              ),
              bottomNavigationBar: CustomNavbar(),
            ),
          );
        });
  }
}
