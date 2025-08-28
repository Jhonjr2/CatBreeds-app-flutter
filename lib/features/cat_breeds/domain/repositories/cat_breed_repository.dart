import 'package:prueba_tecnica/core/errors/failures.dart';
import 'package:prueba_tecnica/features/cat_breeds/domain/entities/cat_breed.dart';
import 'package:dartz/dartz.dart';

abstract class CatBreedRepository {
  Future<Either<Failure, List<CatBreed>>> getCatBreeds();
  Future<Either<Failure, List<String>>> getBreedImages(String breedId);
}
