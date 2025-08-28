import 'package:json_annotation/json_annotation.dart';
import 'package:prueba_tecnica/features/cat_breeds/domain/entities/cat_breed.dart';

part 'cat_breed_model.g.dart';

@JsonSerializable()
class CatBreedModel extends CatBreed {
  @JsonKey(name: 'reference_image_id')
  final String? referenceImageId;

  const CatBreedModel({
    required super.id,
    required super.name,
    required super.description,
    super.origin,
    super.temperament,
    @JsonKey(name: 'energy_level') super.energyLevel,
    super.intelligence,
    @JsonKey(name: 'wikipedia_url') super.wikipediaUrl,
    this.referenceImageId,
  }) : super(
          imageUrl: referenceImageId != null
              ? 'https://cdn2.thecatapi.com/images/$referenceImageId.jpg'
              : null,
        );

  factory CatBreedModel.fromJson(Map<String, dynamic> json) =>
      _$CatBreedModelFromJson(json);

  Map<String, dynamic> toJson() => _$CatBreedModelToJson(this);
}
