import 'package:json_annotation/json_annotation.dart';

import 'package:lichi_test/domain/entity/list_product.dart';

part 'cart_items.g.dart';

@JsonSerializable()
class CartItems {
  final AProduct aproduct;
  final int quantity;
  CartItems({
    required this.aproduct,
    required this.quantity,
  });

  @override
  String toString() {
    return 'CartItems(aproduct: $aproduct, quantity: $quantity)';
  }

  factory CartItems.fromJson(Map<String, dynamic> json) =>
      _$CartItemsFromJson(json);

  Map<String, dynamic> toJson() => _$CartItemsToJson(this);
}
