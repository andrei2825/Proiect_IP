import 'package:book_panda/constants/controllers.dart';
import 'package:book_panda/models/request.dart';
import 'package:book_panda/screens/view_requests/controller/request_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../../../data/firebase_methods.dart';

class ViewPendingRequests extends GetView<RequestController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Pending requests'),
          leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: const Icon(
              Icons.arrow_back, // add custom icons also
            ),
          ),
        ),
        body: Obx(
                () => Padding(
              padding: const EdgeInsets.only(top: 10),
              child: ListView.builder(
                itemExtent: 100,
                itemCount: requestController.requestPendingList.length,
                itemBuilder: (_, index) {
                  return _cardBuilder(requestController.requestsPending[index]);
                },
              ),
            )
        ),
      ),
    );
  }
}

Widget _cardBuilder(Request item) {
  return Card(
    elevation: 8,
    shadowColor: Colors.blue,
    margin: EdgeInsets.all(10),
    shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.blue, width: 1)),
    child: Padding(
      padding: const EdgeInsets.only(right: 5),
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Room Title',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(item.roomTitle!)
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Period',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text('${item.startDate} - ${item.endDate}')
              ],
            ),
          ),
          Expanded(
            child: TextButton(
              onPressed: () {
                FirebaseMethods().cancelRequest(item.requestId!);
              },
              child: Text(
                'delete'.toUpperCase(),
                style: const TextStyle(fontSize: 14),
              ),
              style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.red)))),
            ),
          ),
        ],
      ),
    ),
  );
}
