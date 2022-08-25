import 'product.dart';

class Category {
  String id;
  String name;
  List<Product> products;
  
  Category({
    required this.id,
    required this.name,
    required this.products,
  });
}
