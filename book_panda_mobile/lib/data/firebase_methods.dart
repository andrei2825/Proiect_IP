import 'package:book_panda/models/request.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/room.dart';

class FirebaseMethods {
  final _firestore = FirebaseFirestore.instance;
  FirebaseMethods._internal();
  static final FirebaseMethods _instance = FirebaseMethods._internal();
  FirebaseMethods._();
  factory FirebaseMethods() {
    return _instance;
  }

  FirebaseMethods._protected();

  Future<List<Room>?> getRooms() async {
    var roomDocs = await _firestore.collection('rooms').get();

    return roomDocs.docs.map((e) => Room.fromMap(e.data())).toList();
  }

  Stream<List<Room>> roomStream() {
    return _firestore
        .collection('rooms')
        .orderBy('title', descending: false)
        .snapshots()
        .map((QuerySnapshot querySnapshot) {
      List<Room> retVal = [];
      for (var element in querySnapshot.docs) {
        retVal.add(Room.fromMap(element.data() as Map<String, dynamic>));
      }
      return retVal;
    });
  }

  Stream<List<Request>> requestPendingStream() {
    return _firestore
        .collection('requests')
        .where('status', isEqualTo: 'pending')
        .orderBy('startDate', descending: false)
        .snapshots()
        .map((QuerySnapshot querySnapshot) {
      List<Request> retVal = [];
      for (var element in querySnapshot.docs) {
        retVal.add(Request.fromMap(element.data() as Map<String, dynamic>));
      }
      return retVal;
    });
  }

  Stream<List<Request>> requestAcceptedStream() {
    return _firestore
        .collection('requests')
        .where('status', isEqualTo: 'accepted')
        .orderBy('startDate', descending: false)
        .snapshots()
        .map((QuerySnapshot querySnapshot) {
      List<Request> retVal = [];
      for (var element in querySnapshot.docs) {
        retVal.add(Request.fromMap(element.data() as Map<String, dynamic>));
      }
      return retVal;
    });
  }

  Future<String?> createNewRequestId() async {
    DocumentReference? docRef;
    try {
      docRef = await _firestore.collection('requests').add({});
    } catch (e) {
      print(e.toString());
    }
    return docRef?.id;
  }

  Future<void> cancelRequest(String requestId) async {
    await _firestore
        .collection('requests')
        .doc(requestId)
        .set({'status': 'canceled'});
  }
}
