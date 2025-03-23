import 'package:core/di/service_locator.dart';
import 'package:domain/usecases/get_pokemons.dart';
import 'package:presentation/viewmodels/pokemon_viewmodel.dart';

void setupPresentationLocator() {
  getIt.registerFactory<PokemonViewModel>(
    () => PokemonViewModel(getPokemons: getIt<GetPokemons>()),
  );
}
