import 'package:prueba_tecnica/core/network/dio_client.dart';
import 'package:prueba_tecnica/features/cat_breeds/data/datasources/cat_breed_remote_data_source.dart';
import 'package:prueba_tecnica/features/cat_breeds/data/repositories/cat_breed_repository_impl.dart';
import 'package:prueba_tecnica/features/cat_breeds/domain/repositories/cat_breed_repository.dart';
import 'package:prueba_tecnica/features/cat_breeds/domain/usecases/get_cat_breeds.dart';
import 'package:prueba_tecnica/features/cat_breeds/presentation/bloc/cat_breeds_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final getIt = GetIt.instance;

@injectableInit
void configureDependencies() {
  // Network
  getIt.registerLazySingleton<DioClient>(() => DioClient());

  // Data sources
  getIt.registerLazySingleton<CatBreedRemoteDataSource>(
    () => CatBreedRemoteDataSource(getIt<DioClient>().dio),
  );

  // Repositories
  getIt.registerLazySingleton<CatBreedRepository>(
    () => CatBreedRepositoryImpl(remoteDataSource: getIt<CatBreedRemoteDataSource>()),
  );

  // Use cases
  getIt.registerLazySingleton(() => GetCatBreeds(getIt<CatBreedRepository>()));

  // Bloc
  getIt.registerFactory(
    () => CatBreedsBloc(getCatBreeds: getIt<GetCatBreeds>()),
  );
}
