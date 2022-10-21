
class ShippingAddress {
  String id;
  String name;
  String address;
  bool isDefaultAddress;

  ShippingAddress({
    this.isDefaultAddress = false,
    required this.id,
    required this.name,
    required this.address,
  });

  factory ShippingAddress.fromMap(Map<String, dynamic> map) {
    return ShippingAddress(
      id: map['id'].toString(),
      name: map['title'] as String,
      address: map['address'] as String,
      isDefaultAddress: map['default'] == 1 ? true : false,
    );
  }
}
