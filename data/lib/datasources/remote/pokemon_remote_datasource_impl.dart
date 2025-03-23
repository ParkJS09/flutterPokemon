import 'package:core/network/api_client.dart';
import 'package:data/datasources/remote/pokemon_remote_datasource.dart';
import 'package:data/models/pokemon_model.dart';

class PokemonRemoteDataSourceImpl extends PokemonRemoteDataSource {
  final ApiClient apiClient;
  static const int LIMIT = 20;

  PokemonRemoteDataSourceImpl({required this.apiClient});

  @override
  Future<PokemonModel> getPokemonById(int id) async {
    final response = await apiClient.get('pokemon/$id');
    return PokemonModel.fromJson(response);
  }

  @override
  Future<List<PokemonModel>> getPokemons({int page = 0}) async {
    final offset = page * 20; // 페이지당 20개
    final response = await apiClient.get('pokemon?limit=$LIMIT&offset=$offset');
    final results = response['results'] as List;

    List<PokemonModel> pokemons = [];

    for (var pokemon in results) {
      final detailsUrl = pokemon['url'];
      final pokemonDetails = await apiClient.getFullUrl(detailsUrl);
      pokemons.add(PokemonModel.fromJson(pokemonDetails));
    }

    return pokemons;
  }
}
