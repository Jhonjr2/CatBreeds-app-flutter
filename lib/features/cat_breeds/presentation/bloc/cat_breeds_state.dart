import 'package:prueba_tecnica/features/cat_breeds/domain/entities/cat_breed.dart';
import 'package:equatable/equatable.dart';

abstract class CatBreedsState extends Equatable {
  const CatBreedsState();

  @override
  List<Object> get props => [];
}

class CatBreedsInitial extends CatBreedsState {}

class CatBreedsLoading extends CatBreedsState {}

class CatBreedsLoaded extends CatBreedsState {
  final List<CatBreed> breeds;
  final List<CatBreed> filteredBreeds;
  final String? searchQuery;
  final String? filterOrigin;

  const CatBreedsLoaded({
    required this.breeds,
    required this.filteredBreeds,
    this.searchQuery,
    this.filterOrigin,
  });

  @override
  List<Object> get props => [breeds, filteredBreeds];

  CatBreedsLoaded copyWith({
    List<CatBreed>? breeds,
    List<CatBreed>? filteredBreeds,
    String? searchQuery,
    String? filterOrigin,
  }) {
    return CatBreedsLoaded(
      breeds: breeds ?? this.breeds,
      filteredBreeds: filteredBreeds ?? this.filteredBreeds,
      searchQuery: searchQuery ?? this.searchQuery,
      filterOrigin: filterOrigin ?? this.filterOrigin,
    );
  }
}

class CatBreedsError extends CatBreedsState {
  final String message;

  const CatBreedsError(this.message);

  @override
  List<Object> get props => [message];
}
