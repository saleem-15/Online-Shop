import 'package:my_shop/models/product.dart';
import 'package:my_shop/models/product_preview.dart';

 Future<Product> fetchProductDetails(ProductPreview product) async{
   String description =
      'Lorem ipsum dolor sit amet consectetur adipisicing elit. Officia pariatur mollitia saepe ratione omnis quae debitis! Sequi, esse odio! Eius?';

  final colors = [
    0xff607d8a,
    0xff7a5548,
    0xff797979,
    0xff9f9f9f,
  ];
  final sizes = [
    'S',
    'M',
    'L',
  ];
  return Product(
    id: product.id,
    name: product.name,
    description: description,
    price: product.price,
    isFavorite: product.isFavorite,
    images: [product.image, product.image],
    colors: colors,
    sizes: sizes,
  );
}
