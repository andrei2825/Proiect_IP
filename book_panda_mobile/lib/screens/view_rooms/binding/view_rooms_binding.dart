import 'package:get/get.dart';

import '../controller/view_rooms_controller.dart';

class ViewRoomsBinding extends Bindings {

  @override
  void dependencies() {
    Get.put<ViewRoomsController>(ViewRoomsController(), permanent: true);
  }
}