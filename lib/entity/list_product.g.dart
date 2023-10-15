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
      sizes: json['sizes'] as String? ?? 'XS',
      colors: Colors.fromJson(json['colors'] as Map<String, dynamic>),
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
      'sizes': instance.sizes,
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
      blurhash: json['blurhash'] as String,
      basicColor:
          BasicColor.fromJson(json['basicColor'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PhotoToJson(Photo instance) => <String, dynamic>{
      'big': instance.big,
      'thumbs': instance.thumbs,
      'blurhash': instance.blurhash,
      'basicColor': instance.basicColor,
    };

Thumbs _$ThumbsFromJson(Map<String, dynamic> json) => Thumbs(
      n768_1024: json['n768_1024'] as String,
      n384_512: json['n384_512'] as String,
    );

Map<String, dynamic> _$ThumbsToJson(Thumbs instance) => <String, dynamic>{
      'n768_1024': instance.n768_1024,
      'n384_512': instance.n384_512,
    };

BasicColor _$BasicColorFromJson(Map<String, dynamic> json) => BasicColor(
      colors:
          (json['colors'] as List<dynamic>).map((e) => e as String).toList(),
      luminance: (json['luminance'] as num).toDouble(),
    );

Map<String, dynamic> _$BasicColorToJson(BasicColor instance) =>
    <String, dynamic>{
      'colors': instance.colors,
      'luminance': instance.luminance,
    };

Descriptions _$DescriptionsFromJson(Map<String, dynamic> json) => Descriptions(
      markdown: json['mark_down'] as String,
    );

Map<String, dynamic> _$DescriptionsToJson(Descriptions instance) =>
    <String, dynamic>{
      'mark_down': instance.markdown,
    };

Sizes _$SizesFromJson(Map<String, dynamic> json) => Sizes(
      n3: json['n3'] as String,
      n4: json['n4'] as String,
    );

Map<String, dynamic> _$SizesToJson(Sizes instance) => <String, dynamic>{
      'n3': instance.n3,
      'n4': instance.n4,
    };

Colors _$ColorsFromJson(Map<String, dynamic> json) => Colors(
      current: Current.fromJson(json['current'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ColorsToJson(Colors instance) => <String, dynamic>{
      'current': instance.current,
    };

Current _$CurrentFromJson(Map<String, dynamic> json) => Current(
      colorSample: json['color_sample'] as List<dynamic>,
    );

Map<String, dynamic> _$CurrentToJson(Current instance) => <String, dynamic>{
      'color_sample': instance.colorSample,
    };
