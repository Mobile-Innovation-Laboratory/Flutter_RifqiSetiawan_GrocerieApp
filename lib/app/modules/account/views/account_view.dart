import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tubes_motion/app/widgets/navbar/custom_navbar.dart';

import '../controllers/account_controller.dart';

class AccountView extends GetView<AccountController> {
  const AccountView({super.key});
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(child: Text("Home")),
      bottomNavigationBar: CustomNavbar(),
    );
  }
}
