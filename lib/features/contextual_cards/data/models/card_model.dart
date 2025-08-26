import 'package:fam/features/contextual_cards/data/models/call_to_action_model.dart';
import 'package:fam/features/contextual_cards/data/models/formatted_text.dart';
import 'package:fam/features/contextual_cards/data/models/gradient_model.dart';
import 'package:fam/features/contextual_cards/data/models/image_model.dart';

class CardModel {
  final int id;
  final String name;
  final String slug;
  final String? title;
  final FormattedText? formattedTitle;
  final String? description;
  final FormattedText? formattedDescription;
  final ImageModel? bgImage;
  final ImageModel? icon;
  final List<CtaModel>? cta;
  final BgGradient? bgGradient;
  final String? bgColor;
  final String? url;
  final bool isDisabled;
  final bool isShareable;
  final bool isInternal;

  CardModel({
    required this.id,
    required this.name,
    required this.slug,
    this.title,
    this.formattedTitle,
    this.description,
    this.formattedDescription,
    this.bgImage,
    this.icon,
    this.cta,
    this.bgGradient,
    this.bgColor,
    this.url,
    required this.isDisabled,
    required this.isShareable,
    required this.isInternal,
  });

  factory CardModel.fromJson(Map<String, dynamic> json) {
    return CardModel(
      id: json['id'] as int,
      name: json['name'] as String,
      slug: json['slug'] as String,
      title: json['title'] as String?,
      formattedTitle: json['formatted_title'] != null
          ? FormattedText.fromJson(
              json['formatted_title'] as Map<String, dynamic>)
          : null,
      description: json['description'] as String?,
      formattedDescription: json['formatted_description'] != null
          ? FormattedText.fromJson(
              json['formatted_description'] as Map<String, dynamic>)
          : null,
      bgImage: json['bg_image'] != null
          ? ImageModel.fromJson(json['bg_image'] as Map<String, dynamic>)
          : null,
      icon: json['icon'] != null
          ? ImageModel.fromJson(json['icon'] as Map<String, dynamic>)
          : null,
      cta: json['cta'] != null
          ? (json['cta'] as List<dynamic>)
              .map((e) => CtaModel.fromJson(e as Map<String, dynamic>))
              .toList()
          : null,
      bgGradient: json['bg_gradient'] != null
          ? BgGradient.fromJson(json['bg_gradient'] as Map<String, dynamic>)
          : null,
      bgColor: json['bg_color'] as String?,
      url: json['url'] as String?,
      isDisabled: json['is_disabled'] as bool,
      isShareable: json['is_shareable'] as bool,
      isInternal: json['is_internal'] as bool,
    );
  }
}
