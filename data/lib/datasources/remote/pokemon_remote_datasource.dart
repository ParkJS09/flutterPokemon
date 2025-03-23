import 'package:data/models/pokemon_model.dart';

abstract class PokemonRemoteDataSource {
  Future<List<PokemonModel>> getPokemons({int page = 0});
  Future<PokemonModel> getPokemonById(int id);
}
