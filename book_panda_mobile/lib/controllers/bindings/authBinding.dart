import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/get.dart';

import '../authController.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthController());
  }
  
}