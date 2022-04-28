import 'package:book_panda/screens/login.dart';
import 'package:book_panda/screens/signup.dart';
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
        title: Text("Home"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                child: Text("Login"),
                onPressed: () {
                  Get.to(() => Login());
                },
              ),
              ElevatedButton(
                child: Text("Sign Up"),
                onPressed: () {
                  Get.to(() => SignUp());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
