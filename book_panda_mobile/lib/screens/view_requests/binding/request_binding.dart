import 'package:book_panda/screens/view_requests/controller/request_controller.dart';
import 'package:get/get.dart';

class RequestBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<RequestController>(RequestController());
  }

}