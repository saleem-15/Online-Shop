class CartItem {
  String productId;
  String productName;
  double price;
  String imageUrl;
  int quantity;

  /// stores the value of the color like => 0xFFF26E6E
  int? chosenColor;
  String? chosenSize;
  
  double get totalPrice => price * quantity;

  CartItem({
    required this.productId,
    required this.productName,
    required this.price,
    required this.imageUrl,
    required this.quantity,
    this.chosenColor,
    this.chosenSize,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CartItem &&
        other.productId == productId &&
        other.productName == productName &&
        other.price == price &&
        other.imageUrl == imageUrl &&
        other.quantity == quantity &&
        other.chosenColor == chosenColor &&
        other.chosenSize == chosenSize;
  }

  @override
  int get hashCode {
    return productId.hashCode ^
        productName.hashCode ^
        price.hashCode ^
        imageUrl.hashCode ^
        quantity.hashCode ^
        chosenColor.hashCode ^
        chosenSize.hashCode;
  }
}
