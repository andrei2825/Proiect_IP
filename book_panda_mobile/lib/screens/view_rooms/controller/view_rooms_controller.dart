import 'package:book_panda/data/firebase_methods.dart';
import 'package:book_panda/models/room.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';

class ViewRoomsController extends GetxController {
  static ViewRoomsController instance = Get.find();


  RxList<Room> roomList = <Room>[].obs;

  List<Room> get rooms => roomList;

  @override
  void onInit() {
    super.onInit();
    roomList.bindStream(FirebaseMethods().roomStream());
  }

  void openCloseSideMenu(GlobalKey<SideMenuState> sideMenuKey) {
    if (sideMenuKey.currentState!.isOpened) {
      sideMenuKey.currentState!.closeSideMenu();
    }
    else
    {
      sideMenuKey.currentState!.openSideMenu();
    }
  }
}