import 'package:book_panda/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/authController.dart';

class HomeOut extends GetWidget<AuthController> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                child: const Text("Login"),
                onPressed: () {
                  Get.toNamed(Routes.LOGIN);
                },
              ),
              ElevatedButton(
                child: const Text("Sign Up"),
                onPressed: () {
                  Get.toNamed(Routes.SIGNUP);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
