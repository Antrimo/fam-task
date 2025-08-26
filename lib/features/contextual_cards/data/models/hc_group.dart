import 'package:fam/features/contextual_cards/data/models/card_model.dart';

class HcGroup {
  final int id;
  final String name;
  final String designType;
  final int cardType;
  final List<CardModel> cards;
  final bool isScrollable;
  final int? height;
  final bool? isFullWidth;
  final String? slug;
  final int? level;

  HcGroup({
    required this.id,
    required this.name,
    required this.designType,
    required this.cardType,
    required this.cards,
    required this.isScrollable,
    this.height,
    this.isFullWidth,
    this.slug,
    this.level,
  });

  factory HcGroup.fromJson(Map<String, dynamic> json) {
    return HcGroup(
      id: json['id'] as int,
      name: json['name'] as String,
      designType: json['design_type'] as String,
      cardType: json['card_type'] as int,
      cards: (json['cards'] as List<dynamic>)
          .map((e) => CardModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      isScrollable: json['is_scrollable'] as bool,
      height: json['height'] as int?,
      isFullWidth: json['is_full_width'] as bool?,
      slug: json['slug'] as String?,
      level: json['level'] as int,
    );
  }
}
