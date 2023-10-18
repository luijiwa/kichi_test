// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_items.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartItems _$CartItemsFromJson(Map<String, dynamic> json) => CartItems(
      aproduct: AProduct.fromJson(json['aproduct'] as Map<String, dynamic>),
      quantity: json['quantity'] as int,
    );

Map<String, dynamic> _$CartItemsToJson(CartItems instance) => <String, dynamic>{
      'aproduct': instance.aproduct,
      'quantity': instance.quantity,
    };
