// ignore_for_file: public_member_api_docs, sort_constructors_first
class Product {
  String id;
  String name;
  String description;
  double price;
  bool isFavorite;
  List<String> images;
  List<int> colors;
  List<String> sizes;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.isFavorite,
    required this.images,
    required this.colors,
    required this.sizes,
  });
}
