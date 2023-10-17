import 'package:json_annotation/json_annotation.dart';

part 'list_product.g.dart';

@JsonSerializable(explicitToJson: true)
class AProduct {
  final int id;
  // final String template;
  // final String brand_name;
  // final String category_id;
  // final List<String> category_ids;
  // final List<Parent_category_id> parent_category_ids;
  // final String category_name;
  // final String type;
  // final String article;
  // final int popular;
  // final List<dynamic> size_details;
  final int price;
  // final bool block;
  // final int original_price;
  // final bool coming_soon;
  // final String date_create;
  // final bool saleaction;
  final Currency currency;
  final List<Photo> photos;
  // final List<dynamic> videos;
  // final List<dynamic> video_cover;
  // final bool favorite;
  // final int count;
  // final bool subscribe;
  // final Season season;
  // final String name_old;
  final String name;
  final Descriptions descriptions;
  // final Material_descriptions material_descriptions;
  // final Measurements measurements;
  // final String measurements_unit;
  // final Model model;
  // final Stores stores;
  final Sizes sizes;
  // final bool is_ffm;
  final ItemColors colors;
  @JsonKey(name: 'format_price')
  final List<String> formatPrice;
  // final Details_name details_name;
  // final Details details;
  // final bool soldout;
  // final bool available;
  AProduct({
    required this.id,
    required this.price,
    required this.currency,
    required this.photos,
    required this.name,
    required this.descriptions,
    required this.sizes,
    required this.colors,
    required this.formatPrice,
  });

  factory AProduct.fromJson(Map<String, dynamic> json) =>
      _$AProductFromJson(json);

  Map<String, dynamic> toJson() => _$AProductToJson(this);
}

@JsonSerializable()
class Currency {
  final int id;
  final String prefix;
  @JsonKey(name: 'prefix_symbol')
  final String prefixSymbol;
  final String postfix;
  @JsonKey(name: 'postfix_symbol')
  final String postfixSymbol;
  Currency({
    required this.id,
    required this.prefix,
    required this.prefixSymbol,
    required this.postfix,
    required this.postfixSymbol,
  });
  factory Currency.fromJson(Map<String, dynamic> json) =>
      _$CurrencyFromJson(json);

  Map<String, dynamic> toJson() => _$CurrencyToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Photo {
  final String big;
  final Thumbs thumbs;
  Photo({
    required this.big,
    required this.thumbs,
  });
  factory Photo.fromJson(Map<String, dynamic> json) => _$PhotoFromJson(json);

  Map<String, dynamic> toJson() => _$PhotoToJson(this);
}

@JsonSerializable()
class Thumbs {
  final String? n768_1024;
  final String? n384_512;

  Thumbs(this.n768_1024, this.n384_512);
  factory Thumbs.fromJson(Map<String, dynamic> json) => _$ThumbsFromJson(json);

  Map<String, dynamic> toJson() => _$ThumbsToJson(this);
}

@JsonSerializable()
class Descriptions {
  @JsonKey(name: 'mark_down')
  final String markdown;

  Descriptions({
    required this.markdown,
  });
  factory Descriptions.fromJson(Map<String, dynamic> json) =>
      _$DescriptionsFromJson(json);

  Map<String, dynamic> toJson() => _$DescriptionsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Sizes {
  @JsonKey(name: '3')
  final Size size3;
  @JsonKey(name: '4')
  final Size size4;
  @JsonKey(name: '5')
  final Size size5;
  @JsonKey(name: '6')
  final Size size6;
  Sizes({
    required this.size3,
    required this.size4,
    required this.size5,
    required this.size6,
  });
  factory Sizes.fromJson(Map<String, dynamic> json) => _$SizesFromJson(json);

  Map<String, dynamic> toJson() => _$SizesToJson(this);
}

@JsonSerializable()
class Size {
  final int id;
  final String name;
  final int amount;
  final bool show;
  final String barcode;
  final bool subscribe;

  Size({
    required this.id,
    required this.name,
    required this.amount,
    required this.show,
    required this.barcode,
    required this.subscribe,
  });
  factory Size.fromJson(Map<String, dynamic> json) => _$SizeFromJson(json);

  Map<String, dynamic> toJson() => _$SizeToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ItemColors {
  final Current current;
  @JsonKey(name: 'other')
  List<ColorInfo> otherColors;
  ItemColors({
    required this.current,
    List<ColorInfo>? otherColors,
  }) : otherColors = otherColors ?? <ColorInfo>[];

  factory ItemColors.fromJson(Map<String, dynamic> json) =>
      _$ItemColorsFromJson(json);

  Map<String, dynamic> toJson() => _$ItemColorsToJson(this);
}

@JsonSerializable()
class Current {
  final String name;
  final String value;

  Current({
    required this.name,
    required this.value,
  });
  factory Current.fromJson(Map<String, dynamic> json) =>
      _$CurrentFromJson(json);

  Map<String, dynamic> toJson() => _$CurrentToJson(this);
}

@JsonSerializable(includeIfNull: false)
class ColorInfo {
  final String? name;
  final String? value;

  ColorInfo({
    required this.name,
    required this.value,
  });
  factory ColorInfo.fromJson(Map<String, dynamic> json) =>
      _$ColorInfoFromJson(json);

  Map<String, dynamic> toJson() => _$ColorInfoToJson(this);
}
