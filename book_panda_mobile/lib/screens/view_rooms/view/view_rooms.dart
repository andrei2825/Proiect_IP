import 'package:book_panda/constants/controllers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/authController.dart';
import '../../../models/room.dart';

class ViewRooms extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text("Home"),
            leading: GestureDetector(
              onTap: () {/* Write listener code here */},
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
                  padding: EdgeInsets.symmetric(horizontal: 0),
                  itemExtent: 120,
                  itemCount: viewRoomsController.rooms
                      .length, //TODO change to the length of the arrays with rooms
                  itemBuilder: (_, index) {
                    return _cardBuilder(viewRoomsController.rooms[index]);
                  }),
            ),
          )),
    );
  }
}

Widget _cardBuilder(Room item) {
  return Card(
    elevation: 5,
    child: Container(
      child: Row(
        children: [
          Expanded(
            flex: 6,
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      'assets/logo_panda.png',
                    ),
                    fit: BoxFit.fill),
              ),
            ),
          ),
          const Spacer(
            flex: 1,
          ),
          Expanded(
            flex: 14,
            child: Container(
              color: Colors.red,
            ),
          ),
        ],
      ),
    ),
  );
}
