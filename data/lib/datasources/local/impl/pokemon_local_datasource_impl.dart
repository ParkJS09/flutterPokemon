import 'dart:convert';

import 'package:core/error/failures.dart';
import 'package:data/datasources/local/pokemon_local_datasource.dart';
import 'package:data/models/pokemon_model.dart';
import 'package:data/storage/cache_service.dart';

class PokemonLocalDataSourceImpl implements PokemonLocalDataSource {
  final CacheService cacheService;

  PokemonLocalDataSourceImpl({required this.cacheService});

  @override
  Future<List<PokemonModel>> getCachedPokemons() async {
    final cachedData = await cacheService.getData('pokemons_list');
    if (cachedData != null) {
      final List<dynamic> decoded = json.decode(cachedData);
      return decoded.map((e) => PokemonModel.fromJson(e)).toList();
    }
    throw CacheException(message: '캐시된 포켓몬 데이터가 없습니다');
  }

  @override
  Future<void> cachePokemons(List<PokemonModel> pokemons) async {
    final String data = json.encode(
      pokemons.map((pokemon) => pokemon.toJson()).toList(),
    );
    await cacheService.saveData('pokemons_list', data);
  }
}
