class TextEntity {
  final String? text;
  final String type;
  final String? color;
  final int? fontSize;
  final String? fontStyle;
  final String? fontFamily;

  TextEntity({
    this.text,
    required this.type,
    this.color,
    this.fontSize,
    this.fontStyle,
    this.fontFamily,
  });

  factory TextEntity.fromJson(Map<String, dynamic> json) {
    return TextEntity(
      text: json['text'] as String?,
      type: json['type'] as String,
      color: json['color'] as String?,
      fontSize: json['font_size'] as int?,
      fontStyle: json['font_style'] as String?,
      fontFamily: json['font_family'] as String,
    );
  }
}
