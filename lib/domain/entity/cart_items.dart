import 'package:json_annotation/json_annotation.dart';

part 'cart_items.g.dart';

const String tableCartItems = 'CartItems';

class CartItemsFields {
  static final List<String> values = [
    id,
    name,
    image,
    price,
    color,
    size,
    quantity,
  ];

  static const String id = 'id';
  static const String name = 'name';
  static const String image = 'image';
  static const String price = 'price';
  static const String color = 'color';
  static const String size = 'size';
  static const String quantity = 'quantity';
}

@JsonSerializable()
class CartItems {
  final int id;
  final String name;
  final String image;
  final int price;
  final String color;
  final String size;
  final int quantity;
  CartItems({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    required this.color,
    required this.size,
    required this.quantity,
  });

  CartItems copyWith({
    int? id,
    String? name,
    String? image,
    int? price,
    String? color,
    String? size,
    int? quantity,
  }) {
    return CartItems(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
      price: price ?? this.price,
      color: color ?? this.color,
      size: size ?? this.size,
      quantity: quantity ?? this.quantity,
    );
  }

  @override
  String toString() {
    return 'CartItems(id: $id, name: $name, image: $image, price: $price, color: $color, size: $size, quantity: $quantity)';
  }

  factory CartItems.fromJson(Map<String, dynamic> json) =>
      _$CartItemsFromJson(json);

  Map<String, dynamic> toJson() => _$CartItemsToJson(this);
}
