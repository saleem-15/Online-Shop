// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ShippingType {
  String id;
  String name;
  double price;
  int minArrivalTime;
  int maxArrivalTime;
  

  
  String get estimatedDelivery {
    String result = '';
    DateTime minTime = DateTime.now().add(Duration(days: minArrivalTime));
    DateTime maxTime = DateTime.now().add(Duration(days: maxArrivalTime));

    result = DateFormat.MMMd().format(minTime);
    result += '-'; //seperator between two dates

    /// if min and max time are in the same month
    if (minTime.year == maxTime.year && minTime.month == maxTime.month) {
      result += DateFormat.d().format(maxTime);
      return result;
    }

    result += DateFormat.MMMd().format(maxTime);
    return result;
  }

  ShippingType({
    required this.id,
    required this.name,
    required this.price,
    required this.minArrivalTime,
    required this.maxArrivalTime,
  });

  factory ShippingType.fromMap(Map<String, dynamic> map) {
    return ShippingType(
      id: map['shippingType_id'].toString()..printInfo(),
      name: map['title'] as String,
      price: (map['price'] as num).toDouble(),
      minArrivalTime: map['min_arrival_days'] as int,
      maxArrivalTime: map['max_arrival_days'] as int,
    );
  }
}
