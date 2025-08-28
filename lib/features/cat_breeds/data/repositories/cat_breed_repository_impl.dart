import 'package:prueba_tecnica/core/errors/exceptions.dart';
import 'package:prueba_tecnica/core/errors/failures.dart';
import 'package:prueba_tecnica/features/cat_breeds/data/datasources/cat_breed_remote_data_source.dart';
import 'package:prueba_tecnica/features/cat_breeds/domain/entities/cat_breed.dart';
import 'package:prueba_tecnica/features/cat_breeds/domain/repositories/cat_breed_repository.dart';
import 'package:dartz/dartz.dart';

class CatBreedRepositoryImpl implements CatBreedRepository {
  final CatBreedRemoteDataSource remoteDataSource;

  CatBreedRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<CatBreed>>> getCatBreeds() async {
    try {
      final breeds = await remoteDataSource.getBreeds();
      return Right(breeds);
    } on ServerException {
      return Left(const ServerFailure('Failed to load cat breeds'));
    } catch (e) {
      return Left(const ServerFailure('An unexpected error occurred'));
    }
  }

  @override
  Future<Either<Failure, List<String>>> getBreedImages(String breedId) async {
    try {
      final images = await remoteDataSource.getBreedImages(breedId);
      return Right(images.map((image) => image.url).toList());
    } on ServerException {
      return Left(const ServerFailure('Failed to load cat breed images'));
    } catch (e) {
      return Left(const ServerFailure('An unexpected error occurred'));
    }
  }
}
