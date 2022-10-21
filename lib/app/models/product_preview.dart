class ProductPreview {
  String id;
  String name;
  double price;
  bool isFavorite;
  String image;

  ProductPreview({
    required this.id,
    required this.name,
    required this.price,
    required this.isFavorite,
    required this.image,
  });

  factory ProductPreview.fromMap(Map<String, dynamic> map) {
    return ProductPreview(
      id: map['id'].toString(),
      name: map['name'],
      price: (map['price'] as num).toDouble(),
      isFavorite: false,
      image: map['image'] as String,
    );
  }
}
