import 'dart:convert';

import 'product_color.dart';
import 'product_size.dart';

class Product {
  String id;
  String categoryId;
  String name;
  String description;
  double price;
  int quantity;
  bool isFavorite;
  List<String> images;
  List<ProductColor> colors;
  List<ProductSize> sizes;

  Product({
    required this.id,
    required this.categoryId,
    required this.name,
    required this.description,
    required this.price,
    required this.quantity,
    required this.isFavorite,
    required this.images,
    required this.colors,
    required this.sizes,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'category_id': categoryId,
      'name': name,
      'description': description,
      'price': price,
      'isFavorite': isFavorite,
      'images': images,
      'colors': colors,
      'sizes': sizes,
      'quantity': quantity,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
        id: map['id'].toString(),
        categoryId: map['category_id'].toString(),
        name: map['name'],
        description: map['description'],
        price: (map['price'] as num).toDouble(),
        isFavorite: false,
        //map['isFavorite'],
        images: List<String>.from(map['images']),
        colors: (map['colors'] as List)
            .map((e) => ProductColor.fromMap(e))
            .toList(),
        sizes:
            (map['sizes'] as List).map((e) => ProductSize.fromMap(e)).toList(),
        quantity: map['quantity']
        // List<String>.from(map['sizes']),
        );
  }
  String toJson() => json.encode(toMap());
  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source));
}
