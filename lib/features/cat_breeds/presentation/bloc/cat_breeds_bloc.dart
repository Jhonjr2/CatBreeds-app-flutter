import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_tecnica/core/errors/failures.dart';
import 'package:prueba_tecnica/features/cat_breeds/domain/entities/cat_breed.dart';
import 'package:prueba_tecnica/features/cat_breeds/domain/usecases/get_cat_breeds.dart';
import 'cat_breeds_event.dart';
import 'cat_breeds_state.dart';

class CatBreedsBloc extends Bloc<CatBreedsEvent, CatBreedsState> {
  final GetCatBreeds getCatBreeds;

  CatBreedsBloc({required this.getCatBreeds}) : super(CatBreedsInitial()) {
    on<LoadCatBreeds>(_onLoadCatBreeds);
    on<SearchBreeds>(_onSearchBreeds);
    on<FilterByOrigin>(_onFilterByOrigin);
  }

  Future<void> _onLoadCatBreeds(
    LoadCatBreeds event,
    Emitter<CatBreedsState> emit,
  ) async {
    emit(CatBreedsLoading());

    final result = await getCatBreeds();

    result.fold(
      (failure) => emit(CatBreedsError(_mapFailureToMessage(failure))),
      (breeds) => emit(
        CatBreedsLoaded(
          breeds: breeds,
          filteredBreeds: breeds,
        ),
      ),
    );
  }

  void _onSearchBreeds(
    SearchBreeds event,
    Emitter<CatBreedsState> emit,
  ) {
    if (state is! CatBreedsLoaded) return;

    final currentState = state as CatBreedsLoaded;

    List<CatBreed> filteredBreeds = currentState.breeds.where((breed) {
      final query = event.query.toLowerCase();
      return breed.name.toLowerCase().contains(query) ||
          breed.description.toLowerCase().contains(query);
    }).toList();

    // Apply origin filter if active
    if (currentState.filterOrigin != null) {
      filteredBreeds = filteredBreeds
          .where((breed) => breed.origin == currentState.filterOrigin)
          .toList();
    }

    emit(
      currentState.copyWith(
        filteredBreeds: filteredBreeds,
        searchQuery: event.query,
      ),
    );
  }

  void _onFilterByOrigin(
    FilterByOrigin event,
    Emitter<CatBreedsState> emit,
  ) {
    if (state is! CatBreedsLoaded) return;

    final currentState = state as CatBreedsLoaded;

    // Asegurar que el filterOrigin se actualice correctamente
    String? newFilterOrigin = event.origin;
    
    // Si es null (todos), asegurarse de que sea explícitamente null
    if (event.origin == null) {
      newFilterOrigin = null;
    }

    List<CatBreed> filteredBreeds = newFilterOrigin == null
        ? currentState.breeds
        : currentState.breeds
            .where((breed) => breed.origin == newFilterOrigin)
            .toList();

    // Apply search filter if active
    if (currentState.searchQuery != null && currentState.searchQuery!.isNotEmpty) {
      final query = currentState.searchQuery!.toLowerCase();
      filteredBreeds = filteredBreeds.where((breed) {
        return breed.name.toLowerCase().contains(query) ||
            breed.description.toLowerCase().contains(query);
      }).toList();
    }

    // Emitir nuevo estado asegurando que filterOrigin se actualice
    emit(
      CatBreedsLoaded(
        breeds: currentState.breeds,
        filteredBreeds: filteredBreeds,
        searchQuery: currentState.searchQuery,
        filterOrigin: newFilterOrigin,
      ),
    );
  }

 String _mapFailureToMessage(Failure failure) {
  return switch (failure) {
    ServerFailure() => 'Server error: ${failure.message}',
    CacheFailure() => 'Cache error: ${failure.message}',
    _ => 'Unexpected error: ${failure.message}',
  };
}
}