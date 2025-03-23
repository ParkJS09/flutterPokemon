import 'package:core/di/service_locator.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:presentation/states/pokemon_state.dart';
import 'package:presentation/viewmodels/pokemon_viewmodel.dart';

final pokemonViewModelProvider =
    StateNotifierProvider<PokemonViewModel, PokemonState>((ref) {
      // Domain Layer의 UseCase를 직접 주입 받을 필요없이 GetIt에서 ViewModel을 가져옴!
      return getIt<PokemonViewModel>();
    });
