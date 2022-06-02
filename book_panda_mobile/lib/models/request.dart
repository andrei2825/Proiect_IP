import 'package:equatable/equatable.dart';

class Request extends Equatable {
  final String? rid; //roomid
  final String? startDate; // request start date
  final String? endDate; // request end date
  final String? uid; //user id
  final String? status; //pending or accepted
  final String? requestId;
  final String? roomTitle;

  const Request(
      {this.rid,
      this.startDate,
      this.endDate,
      this.uid,
      this.status,
      this.requestId,
      this.roomTitle});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{};

    map['rid'] = rid;
    map['startDate'] = startDate;
    map['endDate'] = endDate;
    map['uid'] = uid;
    map['status'] = status;
    map['requestId'] = requestId;
    map['roomTitle'] = roomTitle;

    return map;
  }

  static Request fromMap(Map<String, dynamic> data) {
    return Request(
        rid: data['rid'],
        startDate: data['startDate'],
        endDate: data['endDate'],
        uid: data['uid'],
        status: data['status'],
        requestId: data['requestId'],
        roomTitle: data['roomTitle']);
  }

  @override
  List<Object?> get props =>
      [rid, startDate, endDate, uid, status, requestId, roomTitle];
}
