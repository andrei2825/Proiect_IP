import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/authController.dart';
import '../../../models/room.dart';

class ViewRooms extends GetWidget<AuthController> {

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        leading: GestureDetector(
          onTap: () { /* Write listener code here */ },
          child: const Icon(
            Icons.menu,  // add custom icons also
          ),
        ),
        actions: [
          Padding(padding: const EdgeInsets.only(right: 20),
          child: GestureDetector(
            onTap: () {
              controller.signOut();
            },
            child: const Icon(
              Icons.logout,
              size: 26,
            ),
          ),)
        ],
      ),
      body: Expanded(
        child: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 10),
            itemCount: 10, //TODO change to the length of the arrays with rooms
            itemBuilder: (_, index) {
          return _cardBuilder(item)
        }),
      )
    );
  }
}

Widget _cardBuilder(Room item) {
  return Container();
}
