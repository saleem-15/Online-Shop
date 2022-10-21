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
}
