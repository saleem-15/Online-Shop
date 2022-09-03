import 'product.dart';

class Category {
  int id;
  String name;
  List<Product> products;

  Category({
    required this.id,
    required this.name,
    this.products = const [],
  });
}
