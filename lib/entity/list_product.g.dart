// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AProduct _$AProductFromJson(Map<String, dynamic> json) => AProduct(
      id: json['id'] as int,
      price: json['price'] as int,
      currency: Currency.fromJson(json['currency'] as Map<String, dynamic>),
      photos: (json['photos'] as List<dynamic>)
          .map((e) => Photo.fromJson(e as Map<String, dynamic>))
          .toList(),
      name: json['name'] as String,
      descriptions:
          Descriptions.fromJson(json['descriptions'] as Map<String, dynamic>),
      sizes: Sizes.fromJson(json['sizes'] as Map<String, dynamic>),
      colors: ItemColors.fromJson(json['colors'] as Map<String, dynamic>),
      formatPrice: (json['format_price'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$AProductToJson(AProduct instance) => <String, dynamic>{
      'id': instance.id,
      'price': instance.price,
      'currency': instance.currency.toJson(),
      'photos': instance.photos.map((e) => e.toJson()).toList(),
      'name': instance.name,
      'descriptions': instance.descriptions.toJson(),
      'sizes': instance.sizes.toJson(),
      'colors': instance.colors.toJson(),
      'format_price': instance.formatPrice,
    };

Currency _$CurrencyFromJson(Map<String, dynamic> json) => Currency(
      id: json['id'] as int,
      prefix: json['prefix'] as String,
      prefixSymbol: json['prefix_symbol'] as String,
      postfix: json['postfix'] as String,
      postfixSymbol: json['postfix_symbol'] as String,
    );

Map<String, dynamic> _$CurrencyToJson(Currency instance) => <String, dynamic>{
      'id': instance.id,
      'prefix': instance.prefix,
      'prefix_symbol': instance.prefixSymbol,
      'postfix': instance.postfix,
      'postfix_symbol': instance.postfixSymbol,
    };

Photo _$PhotoFromJson(Map<String, dynamic> json) => Photo(
      big: json['big'] as String,
      thumbs: Thumbs.fromJson(json['thumbs'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PhotoToJson(Photo instance) => <String, dynamic>{
      'big': instance.big,
      'thumbs': instance.thumbs.toJson(),
    };

Thumbs _$ThumbsFromJson(Map<String, dynamic> json) => Thumbs(
      json['n768_1024'] as String?,
      json['n384_512'] as String?,
    );

Map<String, dynamic> _$ThumbsToJson(Thumbs instance) => <String, dynamic>{
      'n768_1024': instance.n768_1024,
      'n384_512': instance.n384_512,
    };

Descriptions _$DescriptionsFromJson(Map<String, dynamic> json) => Descriptions(
      markdown: json['mark_down'] as String,
    );

Map<String, dynamic> _$DescriptionsToJson(Descriptions instance) =>
    <String, dynamic>{
      'mark_down': instance.markdown,
    };

Sizes _$SizesFromJson(Map<String, dynamic> json) => Sizes(
      size3: Size.fromJson(json['3'] as Map<String, dynamic>),
      size4: Size.fromJson(json['4'] as Map<String, dynamic>),
      size5: Size.fromJson(json['5'] as Map<String, dynamic>),
      size6: Size.fromJson(json['6'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SizesToJson(Sizes instance) => <String, dynamic>{
      '3': instance.size3.toJson(),
      '4': instance.size4.toJson(),
      '5': instance.size5.toJson(),
      '6': instance.size6.toJson(),
    };

Size _$SizeFromJson(Map<String, dynamic> json) => Size(
      id: json['id'] as int,
      name: json['name'] as String,
      amount: json['amount'] as int,
      show: json['show'] as bool,
      barcode: json['barcode'] as String,
      subscribe: json['subscribe'] as bool,
    );

Map<String, dynamic> _$SizeToJson(Size instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'amount': instance.amount,
      'show': instance.show,
      'barcode': instance.barcode,
      'subscribe': instance.subscribe,
    };

ItemColors _$ItemColorsFromJson(Map<String, dynamic> json) => ItemColors(
      current: Current.fromJson(json['current'] as Map<String, dynamic>),
      otherColors: (json['other'] as List<dynamic>?)
          ?.map((e) => ColorInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ItemColorsToJson(ItemColors instance) =>
    <String, dynamic>{
      'current': instance.current.toJson(),
      'other': instance.otherColors.map((e) => e.toJson()).toList(),
    };

Current _$CurrentFromJson(Map<String, dynamic> json) => Current(
      name: json['name'] as String,
      value: json['value'] as String,
    );

Map<String, dynamic> _$CurrentToJson(Current instance) => <String, dynamic>{
      'name': instance.name,
      'value': instance.value,
    };

ColorInfo _$ColorInfoFromJson(Map<String, dynamic> json) => ColorInfo(
      name: json['name'] as String?,
      value: json['value'] as String?,
    );

Map<String, dynamic> _$ColorInfoToJson(ColorInfo instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('value', instance.value);
  return val;
}
