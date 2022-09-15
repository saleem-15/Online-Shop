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
}
