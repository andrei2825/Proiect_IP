import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/room.dart';

class ViewRoom extends StatelessWidget {
  final Room item;
  const ViewRoom({required this.item});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(item.title!),
          leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: const Icon(
              Icons.arrow_back, // add custom icons also
            ),
          ),
        ),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 300,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(item.photosIds![0]),
                        ),
                      ),
                    ),
                    ListTile(
                      title: Text(
                        item.title!,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      trailing: RichText(
                        text: TextSpan(
                          children: [
                            WidgetSpan(
                              child: const Icon(
                                Icons.people, // add custom icons also
                              ),
                            ),
                            TextSpan(
                              text: " " + item.capacity.toString(),
                              style:
                                  TextStyle(fontSize: 18, color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ),
                    ListTile(
                      subtitle: RichText(
                        text: TextSpan(
                          text: "Room description: \n" + item.description!,
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        ),
                      ),
                    ),
                    SizedBox(height: 90),
                  ],
                ),
              ),
              ListTile(
                title: RichText(
                  text: TextSpan(
                    children: [
                      WidgetSpan(
                        child: TextButton(
                          onPressed: () {},
                          child: Container(
                            height: 50,
                            width: 200,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(border: Border.all()),
                            child: Text(
                              "Check Availibility",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                trailing: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan( 
                        text: item.price.toString() + "€",
                        style: TextStyle(fontSize: 30, color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
