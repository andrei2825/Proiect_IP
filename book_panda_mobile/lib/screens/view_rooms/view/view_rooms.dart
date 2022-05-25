import 'package:book_panda/constants/controllers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/room.dart';
import './view_room.dart';

class ViewRooms extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Home"),
          leading: GestureDetector(
            onTap: () {
              // TODO: Burger menu
            },
            child: const Icon(
              Icons.menu, // add custom icons also
            ),
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
                    .length, //TODO change to the length of the arrays with rooms
                itemBuilder: (_, index) {
                  return _cardBuilder(viewRoomsController.rooms[index]);
                }),
          ),
        ),
      ),
    );
  }
}

Widget _cardBuilder(Room item) {
  return ElevatedButton(
    onPressed: () => {
      Get.to(ViewRoom(item: item)) 
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
