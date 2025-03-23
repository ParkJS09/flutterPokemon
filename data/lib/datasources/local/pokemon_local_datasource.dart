import 'package:data/models/pokemon_model.dart';

abstract class PokemonLocalDataSource {
  Future<List<PokemonModel>> getCachedPokemons();
  Future<void> cachePokemons(List<PokemonModel> pokemons);
}
