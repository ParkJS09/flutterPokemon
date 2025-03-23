import 'package:core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:domain/entities/pokemon.dart';
import 'package:domain/repositories/pokemon_repository.dart';

class GetPokemons {
  final PokemonRepository pokemonRepository;

  const GetPokemons({required this.pokemonRepository});

  Future<Either<Failure, List<Pokemon>>> call({int page = 0}) async {
    return pokemonRepository.getPokemons(page: page);
  }
}
