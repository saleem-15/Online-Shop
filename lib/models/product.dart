import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Product {
  String id;
  String categoryId;
  String name;
  String description;
  double price;
  bool isFavorite;
  List<String> images;
  List<int> colors;
  List<String> sizes;

  Product({
    required this.id,
    required this.categoryId,
    required this.name,
    required this.description,
    required this.price,
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
      colors: List<int>.from(map['colors']),
      sizes: List<String>.from(map['sizes']),
    );
  }
  String toJson() => json.encode(toMap());
  factory Product.fromJson(String source) => Product.fromMap(json.decode(source));
}
