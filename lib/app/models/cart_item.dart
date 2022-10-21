import 'dart:convert';

import 'product_color.dart';
import 'product_size.dart';

class CartItem {
  String id;
  String productId;
  String productName;
  double price;
  double totoalPrice;
  String imageUrl;
  int quantity;

  /// stores the value of the color like => 0xFFF26E6E
  ProductColor? chosenColor;
  ProductSize? chosenSize;

  double get totalPrice => price * quantity;

  CartItem({
    required this.id,
    required this.productId,
    required this.productName,
    required this.price,
    required this.totoalPrice,
    required this.imageUrl,
    required this.quantity,
    this.chosenColor,
    this.chosenSize,
  });

  factory CartItem.fromMap(Map<String, dynamic> map) {
    return CartItem(
      id: map['item_id'].toString(),
      productId: map['product_id'].toString(),
      productName: map['product_name'],
      price: double.parse(map['product_price'].toString()),
      totoalPrice: double.parse(map['total_price'].toString()),
      imageUrl: map['image_url'],
      quantity: (map['quantity']),
      chosenColor: ProductColor.fromMap(map['color']),
      chosenSize: map['size'] == null ? null : ProductSize.fromMap(map['size']),
    );
  }
  factory CartItem.fromJson(String source) =>
      CartItem.fromMap(json.decode(source));
}
