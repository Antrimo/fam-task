import 'package:fam/features/contextual_cards/data/models/hc_group.dart';

class ContextualCardModel {
  final int id;
  final String slug;
  final String? title;
  final dynamic formattedTitle;
  final String? description;
  final dynamic formattedDescription;
  final dynamic assets;
  final List<HcGroup> hcGroups;

  ContextualCardModel({
    required this.id,
    required this.slug,
    this.title,
    this.formattedTitle,
    this.description,
    this.formattedDescription,
    this.assets,
    required this.hcGroups,
  });

  factory ContextualCardModel.fromJson(Map<String, dynamic> json) {
    return ContextualCardModel(
      id: json['id'] as int,
      slug: json['slug'] as String,
      title: json['title'] as String?,
      formattedTitle: json['formatted_title'],
      description: json['description'] as String?,
      formattedDescription: json['formatted_description'],
      assets: json['assets'],
      hcGroups: (json['hc_groups'] as List<dynamic>)
          .map((e) => HcGroup.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}
