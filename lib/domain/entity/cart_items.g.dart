// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_items.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartItems _$CartItemsFromJson(Map<String, dynamic> json) => CartItems(
      id: json['id'] as int,
      name: json['name'] as String,
      image: json['image'] as String,
      price: json['price'] as int,
      color: json['color'] as String,
      size: json['size'] as String,
      quantity: json['quantity'] as int,
    );

Map<String, dynamic> _$CartItemsToJson(CartItems instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'price': instance.price,
      'color': instance.color,
      'size': instance.size,
      'quantity': instance.quantity,
    };
