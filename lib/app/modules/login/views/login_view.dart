import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tubes_motion/app/routes/app_pages.dart';
import 'package:tubes_motion/app/widgets/button_widget.dart';
import 'package:tubes_motion/app/widgets/text_field_auth_widget.dart';
import 'package:tubes_motion/app/widgets/text_route_auth_widget.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 50,
              ),
              Center(
                child: Image.asset("assets/images/wortelLogin.png"),
              ),
              SizedBox(
                height: 60,
              ),
              Text(
                "Login",
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 7,
              ),
              Text(
                "Enter your emails and password",
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xff7C7C7C),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              TextFieldAuth(
                  title: "Email",
                  isPassword: false,
                  controller: controller.emailController),
              SizedBox(
                height: 20,
              ),
              TextFieldAuth(
                title: "Password",
                isPassword: true,
                controller: controller.passwordController,
                icon: IconButton(
                  icon: Icon(Icons.visibility_off),
                  onPressed: () {},
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "Forgot Password?",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Button(
                  title: "Log In",
                  onPressed: () {
                    Get.toNamed(Routes.DASHBOARD);
                  },
                ),
              ),
              SizedBox(
                height: 25,
              ),
              TextRouteAuth(
                  title: "Don't have an account?",
                  onPressed: () {
                    Get.toNamed(Routes.REGISTER);
                  },
                  subTitle: "Sign Up!"),
            ],
          ),
        ),
      ),
    );
  }
}
