// Mocks generated by Mockito 5.4.5 from annotations
// in data/test/data_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:data/datasources/remote/pokemon_remote_datasource.dart' as _i3;
import 'package:data/models/pokemon_model.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: must_be_immutable
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakePokemonModel_0 extends _i1.SmartFake implements _i2.PokemonModel {
  _FakePokemonModel_0(Object parent, Invocation parentInvocation)
    : super(parent, parentInvocation);
}

/// A class which mocks [PokemonRemoteDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockPokemonRemoteDataSource extends _i1.Mock
    implements _i3.PokemonRemoteDataSource {
  MockPokemonRemoteDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<List<_i2.PokemonModel>> getPokemons() =>
      (super.noSuchMethod(
            Invocation.method(#getPokemons, []),
            returnValue: _i4.Future<List<_i2.PokemonModel>>.value(
              <_i2.PokemonModel>[],
            ),
          )
          as _i4.Future<List<_i2.PokemonModel>>);

  @override
  _i4.Future<_i2.PokemonModel> getPokemonById(int? id) =>
      (super.noSuchMethod(
            Invocation.method(#getPokemonById, [id]),
            returnValue: _i4.Future<_i2.PokemonModel>.value(
              _FakePokemonModel_0(
                this,
                Invocation.method(#getPokemonById, [id]),
              ),
            ),
          )
          as _i4.Future<_i2.PokemonModel>);
}
