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
                    Row(
                      children: [
                        SizedBox(height: 50,),
                        CircleAvatar(
                          radius: 30,
                          backgroundImage: AssetImage('assets/images/avatar'),
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
                      onPressed: () => {},
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.logout_outlined),
                          SizedBox(width: 8),
                          Text('Log Out'),
                        ],
                      ),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.black,
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                          side: BorderSide(color: Colors.grey),
                        ),
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
