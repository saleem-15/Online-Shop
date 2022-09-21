// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:my_shop/models/shipping_address.dart';

import '../screens/orders/components/order_item.dart';

class OrderItem {
  String orderId;
  String productId;
  String productName;
  ShippingAddress shippingAddress;
  double price;
  String imageUrl;
  int quantity;
  OrderStatus status;

  double get totalPrice => price * quantity;

  /// stores the value of the color like => 0xFFF26E6E
  int? chosenColor;
  String? chosenSize;

  OrderItem({
    required this.orderId,
    required this.productId,
    required this.productName,
    required this.shippingAddress,
    required this.price,
    required this.imageUrl,
    required this.quantity,
    required this.status,
    this.chosenColor,
    this.chosenSize,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is OrderItem &&
        other.productId == productId &&
        other.productName == productName &&
        other.price == price &&
        other.imageUrl == imageUrl &&
        other.quantity == quantity &&
        other.chosenColor == chosenColor &&
        other.chosenSize == chosenSize;
  }

  @override
  int get hashCode {
    return productId.hashCode ^
        productName.hashCode ^
        price.hashCode ^
        imageUrl.hashCode ^
        quantity.hashCode ^
        chosenColor.hashCode ^
        chosenSize.hashCode;
  }

  factory OrderItem.fromMap(Map<String, dynamic> map) {
    return OrderItem(
      orderId: map['order_id'].toString(),
      productId: map['product_id'].toString(),
      productName: map['products_name'] as String,
      shippingAddress: ShippingAddress.fromMap(map['address'] as Map<String, dynamic>),
      price: (map['product_price'] as num).toDouble() * int.parse(map['quantity']),
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQR6mNeolQnmtuuUJ3SwppHCm0CfRXTBECfOw&usqp=CAU',

      //  map['imageUrl'] as String,
      quantity: int.parse(map['quantity']),
      status:
          // OrderStatus.inDelievery,
          map['status'] == 'The order in processing' ? OrderStatus.inDelievery : OrderStatus.completed,
      chosenColor: int.parse('0xff${map['color']}'),
      chosenSize: map['size'],
    );
  }


  
  @override
  String toString() {
    return 'OrderItem(orderId: $orderId, productId: $productId, productName: $productName, shippingAddress: $shippingAddress, price: $price, imageUrl: $imageUrl, quantity: $quantity, status: $status, chosenColor: $chosenColor, chosenSize: $chosenSize)';
  }
}
