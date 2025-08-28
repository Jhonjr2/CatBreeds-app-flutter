import 'package:equatable/equatable.dart';

class CatBreed extends Equatable {
  final String id;
  final String name;
  final String description;
  final String? imageUrl;
  final String? origin;
  final String? temperament;
  final int? energyLevel;
  final int? intelligence;
  final String? wikipediaUrl;
  final String? lifeSpan;

  const CatBreed({
    required this.id,
    required this.name,
    required this.description,
    this.imageUrl,
    this.origin,
    this.temperament,
    this.energyLevel,
    this.intelligence,
    this.wikipediaUrl,
    this.lifeSpan,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        imageUrl,
        origin,
        temperament,
        energyLevel,
        intelligence,
        wikipediaUrl,
        lifeSpan,
      ];
}
