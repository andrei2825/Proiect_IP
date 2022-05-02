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
    var roomDocs = await _firestore
        .collection('rooms')
        .get();

    return roomDocs.docs.map((e) => Room.fromMap(e.data())).toList();
  }
}