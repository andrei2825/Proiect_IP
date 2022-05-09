import 'package:book_panda/data/firebase_methods.dart';
import 'package:book_panda/models/room.dart';
import 'package:get/get.dart';

class ViewRoomsController extends GetxController {
  static ViewRoomsController instance = Get.find();

  RxList<Room> roomList = <Room>[].obs;

  List<Room> get rooms => roomList;

  @override
  void onInit() {
    super.onInit();
    roomList.bindStream(FirebaseMethods().roomStream());
  }
}