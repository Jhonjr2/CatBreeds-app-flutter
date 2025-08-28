import 'package:prueba_tecnica/core/errors/failures.dart';
import 'package:prueba_tecnica/features/cat_breeds/domain/entities/cat_breed.dart';
import 'package:prueba_tecnica/features/cat_breeds/domain/repositories/cat_breed_repository.dart';
import 'package:dartz/dartz.dart';

class GetCatBreeds {
  final CatBreedRepository repository;

  GetCatBreeds(this.repository);

  Future<Either<Failure, List<CatBreed>>> call() async {
    return await repository.getCatBreeds();
  }
}
