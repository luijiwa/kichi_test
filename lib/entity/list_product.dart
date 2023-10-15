import 'package:json_annotation/json_annotation.dart';
part 'list_product.g.dart';

@JsonSerializable(explicitToJson: true)
class AProduct {
  final int id; //true
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
  final String sizes;
  // final bool is_ffm;
  final Colors colors;
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
    this.sizes = 'XS',
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

@JsonSerializable()
class Photo {
  final String big;
  final Thumbs thumbs;
  final String blurhash;
  final BasicColor basicColor;
  Photo({
    required this.big,
    required this.thumbs,
    required this.blurhash,
    required this.basicColor,
  });
  factory Photo.fromJson(Map<String, dynamic> json) => _$PhotoFromJson(json);

  Map<String, dynamic> toJson() => _$PhotoToJson(this);
}

@JsonSerializable()
class Thumbs {
  final String n768_1024;
  final String n384_512;
  Thumbs({
    required this.n768_1024,
    required this.n384_512,
  });

  factory Thumbs.fromJson(Map<String, dynamic> json) => _$ThumbsFromJson(json);

  Map<String, dynamic> toJson() => _$ThumbsToJson(this);
}

@JsonSerializable()
class BasicColor {
  final List<String> colors;
  final double luminance;
  BasicColor({
    required this.colors,
    required this.luminance,
  });
  factory BasicColor.fromJson(Map<String, dynamic> json) =>
      _$BasicColorFromJson(json);

  Map<String, dynamic> toJson() => _$BasicColorToJson(this);
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

@JsonSerializable()
class Sizes {
  final String n3;
  final String n4;
  Sizes({
    required this.n3,
    required this.n4,
  });
  factory Sizes.fromJson(Map<String, dynamic> json) => _$SizesFromJson(json);

  Map<String, dynamic> toJson() => _$SizesToJson(this);
}

@JsonSerializable()
class Colors {
  final Current current;

  Colors({
    required this.current,
  });
  factory Colors.fromJson(Map<String, dynamic> json) => _$ColorsFromJson(json);

  Map<String, dynamic> toJson() => _$ColorsToJson(this);
}

@JsonSerializable()
class Current {
  @JsonKey(name: 'color_sample')
  final List<dynamic> colorSample;

  Current({
    required this.colorSample,
  });
  factory Current.fromJson(Map<String, dynamic> json) =>
      _$CurrentFromJson(json);

  Map<String, dynamic> toJson() => _$CurrentToJson(this);
}
