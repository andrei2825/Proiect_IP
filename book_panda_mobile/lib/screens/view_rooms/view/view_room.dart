import 'package:book_panda/screens/view_rooms/view/view_request.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/room.dart';

class ViewRoom extends StatelessWidget {
  final Room item;
  var dateRange = DateTimeRange(
    start: DateTime.now(),
    end: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day + 2),
  ).obs;
  ViewRoom({required this.item});
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
                          image: NetworkImage(item.photosIds!),
                        ),
                      ),
                    ),
                    ListTile(
                      title: Text(
                        item.title!,
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      trailing: RichText(
                        text: TextSpan(
                          children: [
                            const WidgetSpan(
                              child: Padding(
                                padding: EdgeInsets.only(top: 3.0),
                                child: Icon(
                                  Icons.people, // add custom icons also
                                ),
                              ),
                            ),
                            TextSpan(
                              text: " " + item.capacity.toString(),
                              style:
                                  const TextStyle(fontSize: 18, color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ),
                    ListTile(
                      subtitle: RichText(
                        text: TextSpan(
                          text: "Room description: \n" + item.description!,
                          style: const TextStyle(fontSize: 18, color: Colors.black),
                        ),
                      ),
                    ),
                    const SizedBox(height: 90),
                  ],
                ),
              ),
              ListTile(
                title: RichText(
                  text: TextSpan(
                    children: [
                      WidgetSpan(
                        child: TextButton(
                          onPressed: () {
                            Get.to(ViewRequest(rid: item.rid,));
                          },
                          child: Container(
                            height: 50,
                            width: 200,
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(border: Border.all()),
                            child: const Text(
                              "Reserve",
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
                        text: item.price.toString() + "€/night",
                        style: const TextStyle(fontSize: 30, color: Colors.black),
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
