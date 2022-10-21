class ProductColor {
  String id;
  int color;
  String productId;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'color': color,
      'product_id': productId,
    };
  }

  factory ProductColor.fromMap(Map<String, dynamic> map) {
    return ProductColor(
      id: map['id'].toString(),

      /// the color comes from the api as 6 digits so i have to add the prefix (0xff) so it can work
      color: (int.parse('0xFF${map['color']}')),
      productId: map['product_id'].toString(),
    );
  }
  ProductColor({
    required this.id,
    required this.color,
    required this.productId,
  });
}
