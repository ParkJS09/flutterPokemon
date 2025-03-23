import 'package:core/di/service_locator.dart';
import 'package:core/network/api_client.dart';
import 'package:data/datasources/remote/pokemon_remote_datasource.dart';
import 'package:data/datasources/remote/pokemon_remote_datasource_impl.dart';
import 'package:data/repositories/pokemon_repository_impl.dart';
import 'package:domain/repositories/pokemon_repository.dart';

void setupDataLocator() {
  // 내부 구현 등록
  getIt.registerLazySingleton<PokemonRemoteDataSource>(
    () => PokemonRemoteDataSourceImpl(apiClient: getIt<ApiClient>()),
  );

  // 리포지토리 등록
  getIt.registerLazySingleton<PokemonRepository>(
    () => PokemonRepositoryImpl(dataSource: getIt<PokemonRemoteDataSource>()),
  );
}
