// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ProductSize {
  String id;
  String size;
  String productId;

  ProductSize({
    required this.id,
    required this.size,
    required this.productId,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'size': size,
      'product_id': productId,
    };
  }

  factory ProductSize.fromMap(Map<String, dynamic> map) {
    return ProductSize(
      id: map['id'].toString(),
      size: map['size'].toString(),
      productId: map['product_id'].toString(),
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductSize.fromJson(String source) =>
      ProductSize.fromMap(json.decode(source) as Map<String, dynamic>);
}
