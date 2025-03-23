import 'package:core/di/service_locator.dart';
import '../usecases/get_pokemons.dart';
import '../repositories/pokemon_repository.dart';

void setupDomainLocator() {
  getIt.registerLazySingleton(
    () => GetPokemons(pokemonRepository: getIt<PokemonRepository>()),
  );
}
