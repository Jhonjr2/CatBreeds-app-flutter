import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:prueba_tecnica/features/cat_breeds/data/models/cat_breed_model.dart';
import 'package:prueba_tecnica/features/cat_breeds/data/models/cat_image_model.dart';

part 'cat_breed_remote_data_source.g.dart';

@RestApi()
abstract class CatBreedRemoteDataSource {
  factory CatBreedRemoteDataSource(Dio dio, {String baseUrl}) =
      _CatBreedRemoteDataSource;

  @GET('/breeds')
  Future<List<CatBreedModel>> getBreeds();

  @GET('/images/search')
  Future<List<CatImageModel>> getBreedImages(@Query('breed_ids') String breedId);
}
