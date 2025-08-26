class CtaModel {
  final String text;
  final String type;
  final String bgColor;
  final bool isCircular;
  final bool isSecondary;
  final int strokeWidth;

  CtaModel({
    required this.text,
    required this.type,
    required this.bgColor,
    required this.isCircular,
    required this.isSecondary,
    required this.strokeWidth,
  });

  factory CtaModel.fromJson(Map<String, dynamic> json) {
    return CtaModel(
      text: json['text'] as String,
      type: json['type'] as String,
      bgColor: json['bg_color'] as String,
      isCircular: json['is_circular'] as bool,
      isSecondary: json['is_secondary'] as bool,
      strokeWidth: json['stroke_width'] as int,
    );
  }
}
