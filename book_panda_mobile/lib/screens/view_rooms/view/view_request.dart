import 'package:book_panda/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class ViewRequest extends StatefulWidget {
  final String? roomId = Get.arguments;


  @override
  State<ViewRequest> createState() => _ViewRequest();
}

class _ViewRequest extends State<ViewRequest> {
  String _startDate = '';
  String _endDate = '';
  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    setState(() {
      if (args.value is PickerDateRange) {
        _startDate =
            DateFormat('dd/MM/yyyy').format(args.value.startDate).toString();
        _endDate = DateFormat('dd/MM/yyyy')
            .format(args.value.endDate ?? args.value.startDate)
            .toString();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Booking request'),
          leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: const Icon(
              Icons.arrow_back, // add custom icons also
            ),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            SfDateRangePicker(
              onSelectionChanged: _onSelectionChanged,
              selectionMode: DateRangePickerSelectionMode.range,
            ),
            ElevatedButton(
              onPressed: () => {
                FirebaseFirestore.instance
                    .collection('requests')
                    .add({
                      'uid': FirebaseAuth.instance.currentUser?.uid,
                      'startDate': _startDate,
                      'endDate': _endDate,
                      'rid': widget.roomId,
                      'status': 'pending',
                    })
                    .then((value) => print('Request Sent'))
                    .catchError(
                        (error) => print('Failed to send requst: $error')),
                Get.offAllNamed(Routes.VIEWROOMS)
              },
              child: Text('Confirm'),
            ),
          ],
        ),
      ),
    );
  }
}
