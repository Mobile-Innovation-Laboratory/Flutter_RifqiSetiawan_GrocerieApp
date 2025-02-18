import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tubes_motion/app/routes/app_pages.dart';
import 'package:tubes_motion/app/widgets/button.dart';
import 'package:tubes_motion/app/widgets/text_field_auth.dart';
import 'package:tubes_motion/app/widgets/text_route_auth.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({super.key});
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
                child: Image.asset("assets/images/wortelColour.png"),
              ),
              SizedBox(
                height: 60,
              ),
              Text(
                "SignUp",
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 7,
              ),
              Text(
                "Enter your credentials to continue",
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xff7C7C7C),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              TextFieldAuth(
                  title: "Username",
                  isPassword: false,
                  controller: controller.usernameController),
              SizedBox(
                height: 20,
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
                  title: "Sign Up",
                  onPressed: () {
                    
                  },
                ),
              ),
              SizedBox(
                height: 25,
              ),
              TextRouteAuth(
                  title: "Already have an account?",
                  onPressed: () {
                    Get.toNamed(Routes.LOGIN);
                  },
                  subTitle: "Login!"),
            ],
          ),
        ),
      ),
    );
  }
}
