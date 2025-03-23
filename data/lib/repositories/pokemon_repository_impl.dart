import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:data/datasources/remote/pokemon_remote_datasource.dart';
import 'package:domain/entities/pokemon.dart';
import 'package:domain/repositories/pokemon_repository.dart';

class PokemonRepositoryImpl extends PokemonRepository {
  final PokemonRemoteDataSource dataSource;

  PokemonRepositoryImpl({required this.dataSource});

  @override
  Future<Either<Failure, Pokemon>> getPokemonById(int id) async {
    try {
      final pokemon = await dataSource.getPokemonById(id);
      return Right(pokemon);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Pokemon>>> getPokemons({int page = 0}) async {
    try {
      final result = await dataSource.getPokemons(page: page);
      return Right(result);
    } catch (e) {
      return Left(NetworkFailure(message: '알 수 없는 오류가 발생했습니다: $e'));
    }
  }
}
