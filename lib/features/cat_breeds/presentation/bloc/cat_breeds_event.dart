import 'package:equatable/equatable.dart';

abstract class CatBreedsEvent extends Equatable {
  const CatBreedsEvent();

  @override
  List<Object> get props => [];
}

class LoadCatBreeds extends CatBreedsEvent {}

class SearchBreeds extends CatBreedsEvent {
  final String query;

  const SearchBreeds(this.query);

  @override
  List<Object> get props => [query];
}

class FilterByOrigin extends CatBreedsEvent {
  final String? origin;

  const FilterByOrigin(this.origin);

  @override
  List<Object> get props => [origin ?? ''];
}
