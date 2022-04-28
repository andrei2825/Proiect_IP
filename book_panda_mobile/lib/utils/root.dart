import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../controllers/authController.dart';
import '../screens/homeIn.dart';
import '../screens/homeOut.dart';
import '../screens/login.dart';

class Root extends GetWidget<AuthController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return (Get.find<AuthController>().user != null) ? HomeIn() : HomeOut();
    });
  }

}