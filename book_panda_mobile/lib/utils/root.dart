import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../controllers/authController.dart';
import '../screens/home.dart';
import '../screens/login.dart';

class Root extends GetWidget<AuthController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return (Get.find<AuthController>().user != null) ? Home() : Login();
    });
  }

}