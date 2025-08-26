import 'package:fam/features/contextual_cards/data/models/text_entity.dart';

class FormattedText {
  final String text;
  final String align;
  final List<TextEntity> entities;

  FormattedText({
    required this.text,
    required this.align,
    required this.entities,
  });

  factory FormattedText.fromJson(Map<String, dynamic> json) {
    return FormattedText(
      text: json['text'] as String,
      align: json['align'] as String,
      entities: (json['entities'] as List<dynamic>)
          .map((e) => TextEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}
