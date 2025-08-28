import 'package:json_annotation/json_annotation.dart';

part 'cat_image_model.g.dart';

@JsonSerializable()
class CatImageModel {
  final String id;
  final String url;
  final int width;
  final int height;

  const CatImageModel({
    required this.id,
    required this.url,
    required this.width,
    required this.height,
  });

  factory CatImageModel.fromJson(Map<String, dynamic> json) =>
      _$CatImageModelFromJson(json);

  Map<String, dynamic> toJson() => _$CatImageModelToJson(this);
}
