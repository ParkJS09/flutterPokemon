import 'package:data/datasources/remote/pokemon_remote_datasource.dart';
import 'package:data/datasources/remote/pokemon_remote_datasource_impl.dart';
import 'package:data/models/pokemon_model.dart';
import 'package:domain/entities/pokemon.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test/test.dart';
import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:data/data.dart';

@GenerateMocks([PokemonRemoteDataSource])
void main() {}
