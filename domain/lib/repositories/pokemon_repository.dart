import 'package:core/error/failures.dart';
import 'package:domain/entities/pokemon.dart';
import 'package:dartz/dartz.dart';

abstract class PokemonRepository {
  Future<Either<Failure, List<Pokemon>>> getPokemons({int page = 0});
  Future<Either<Failure, Pokemon>> getPokemonById(int id);
}
