import 'package:my_shop/models/product_preview.dart';

class Category {
  int id;
  String name;
  List<ProductPreview>? products;

  //these 3 variables for pagination
  int pageKey = 1;
  int numOfPages = 1;
  late int totalNumOfProducts;

  Category({
    required this.id,
    required this.name,
    this.products,
  });
}
