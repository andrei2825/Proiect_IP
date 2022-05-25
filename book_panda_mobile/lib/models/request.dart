import 'package:equatable/equatable.dart';

class Request extends Equatable {
  final String? rid; //roomid
  final DateTime? startDate; // request start date
  final DateTime? endDate; // request end date
  final String? uid; //user id

  const Request({
    this.rid,
    this.startDate,
    this.endDate,
    this.uid,
  });

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{};

    map['rid'] = rid;
    map['startDate'] = startDate;
    map['endDate'] = endDate;
    map['uid'] = uid;

    return map;
  }

  static Request fromMap(Map<String, dynamic> data) {
    return Request(
      rid: data['rid'],
      startDate: data['startDate'],
      endDate: data['endDate'],
      uid: data['uid'],
    );
  }

  @override
  List<Object?> get props => [
        rid,
        startDate,
        endDate,
        uid,
      ];
}
