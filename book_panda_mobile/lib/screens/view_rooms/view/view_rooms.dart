import 'package:book_panda/constants/controllers.dart';
import 'package:book_panda/routes/app_routes.dart';
import 'package:book_panda/screens/view_rooms/controller/view_rooms_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';

import '../../../models/room.dart';
import './view_room.dart';

class ViewRooms extends GetView<ViewRoomsController> {
  GlobalKey<SideMenuState> sideMenuKey = GlobalKey<SideMenuState>();

  @override
  Widget build(BuildContext context) {
    return SideMenu(
      type: SideMenuType.shrikNRotate,
      menu: buildMenu(sideMenuKey),
      key: sideMenuKey,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Home"),
            leading: IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                viewRoomsController.openCloseSideMenu(sideMenuKey);
              },
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: GestureDetector(
                  onTap: () {
                    authController.signOut();
                  },
                  child: const Icon(
                    Icons.logout,
                    size: 26,
                  ),
                ),
              )
            ],
          ),
          body: Obx(
            () => Padding(
              padding: const EdgeInsets.only(top: 10),
              child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 0),
                  itemExtent: 140,
                  itemCount: viewRoomsController.rooms
                      .length,
                  itemBuilder: (_, index) {
                    return _cardBuilder(viewRoomsController.rooms[index], sideMenuKey);
                  }),
            ),
          ),
        ),
      ),
    );
  }
}

Widget buildMenu(GlobalKey<SideMenuState> sideMenuKey) {
  return SingleChildScrollView(
    padding: EdgeInsets.all(50),
    child: Column(children: [
      ListTile(
        onTap: () {
          sideMenuKey.currentState!.closeSideMenu();
          Get.toNamed(Routes.VIEWPENDINGREQUESTS);
          },
        leading: const Icon(Icons.house, size: 20.0, color: Colors.white),
        title: const Text("Pending requests"),
        textColor: Colors.white,
        dense: true,
      ),
      ListTile(
        onTap: () {
          sideMenuKey.currentState!.closeSideMenu();
          Get.toNamed(Routes.VIEWACCEPTEDREQUESTS);
        },
        leading:
        const Icon(Icons.holiday_village, size: 20.0, color: Colors.white),
        title: const Text("Accepted requests"),
        textColor: Colors.white,
        dense: true,

        // padding: EdgeInsets.zero,
      ),

    ]),
  );
}

Widget _cardBuilder(Room item, GlobalKey<SideMenuState> sideMenuKey) {
  return ElevatedButton(
    onPressed: () {
      Get.toNamed(Routes.VIEWROOM, arguments: item);
      if(sideMenuKey.currentState!.isOpened) {
        sideMenuKey.currentState!.closeSideMenu();
      }
    },
    style: ElevatedButton.styleFrom(
      primary: Colors.white,
    ),
    child: Card(
      elevation: 5,
      child: Container(
        child: Row(
          children: [
            Expanded(
              flex: 7,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(item.photosIds!),
                      fit: BoxFit.fill),
                ),
              ),
            ),
            Expanded(
              flex: 14,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(item.title!),
                        Text(item.description!),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('${item.capacity!} pers'),
                            Text('${item.price!} Euro'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
