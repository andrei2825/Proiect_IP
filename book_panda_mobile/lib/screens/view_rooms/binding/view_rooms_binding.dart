import 'package:get/get.dart';

import '../controller/view_rooms_controller.dart';

class ViewRoomsBinding extends Bindings {

  @override
  void dependencies() {
    //Get.lazyPut<ViewRoomsController>(() => ViewRoomsController(),fenix: true);
    Get.put<ViewRoomsController>(ViewRoomsController(), permanent: true);
  }
}