import 'package:equatable/equatable.dart';

class Room extends Equatable {
  final String? rid; //roomid
  final int? capacity;
  final String? description;
  final int? price;
  final List<String>? photosIds;
  final String? title;

  const Room(
      {this.title, this.rid, this.capacity, this.description, this.price, this.photosIds});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{};

    map['title'] = title;
    map['rid'] = rid;
    map['capacity'] = capacity;
    map['description'] = description;
    map['price'] = price;
    map['photosIds'] = photosIds;

    return map;
  }

  static Room fromMap(Map<String, dynamic> data) {
    return Room(
        title: data['title'],
        rid: data['rid'],
        capacity: data['capacity'],
        description: data['description'],
        price: data['price'],
        photosIds: data['photosIds'] != null
          ? List<String>.from(data['photosIds'])
          : []);
  }

  @override
  List<Object?> get props => [title, rid, description, capacity, price, photosIds];

  static const empty =
      Room(title: '', rid: '', capacity: 0, description: '', price: 0, photosIds: []);
}
