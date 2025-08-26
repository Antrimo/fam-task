class ImageModel {
  final String imageType;
  final String imageUrl;
  final double aspectRatio;

  ImageModel({
    required this.imageType,
    required this.imageUrl,
    required this.aspectRatio,
  });

  factory ImageModel.fromJson(Map<String, dynamic> json) {
    return ImageModel(
      imageType: json['image_type'],
      imageUrl: json['image_url'],
      aspectRatio: (json['aspect_ratio'] as num).toDouble(),
    );
  }
}
