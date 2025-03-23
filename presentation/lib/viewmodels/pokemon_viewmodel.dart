import 'package:domain/usecases/get_pokemons.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:presentation/states/pokemon_state.dart';

class PokemonViewModel extends StateNotifier<PokemonState> {
  // Pokemon 조회 UseCase
  final GetPokemons getPokemons;
  int _currentPage = 0;
  bool _isLoading = false;
  bool _hasMoreData = true;

  PokemonViewModel({required this.getPokemons})
    : super(PokemonState(pokemons: [], isLoading: false));

  Future<void> loadPokemons({bool refresh = false}) async {
    if (state.isLoading || (!refresh && !_hasMoreData)) return;

    state = state.copyWith(isLoading: true);

    if (refresh) {
      _currentPage = 0;
      state = state.copyWith(pokemons: []);
    }

    final result = await getPokemons(page: _currentPage);

    result.fold(
      (failure) {
        state = state.copyWith(isLoading: false, error: failure.toString());
      },
      (newPokemons) {
        if (newPokemons.isEmpty) {
          _hasMoreData = false;
        }

        final updatedPokemons =
            refresh ? newPokemons : [...state.pokemons, ...newPokemons];

        state = state.copyWith(
          isLoading: false,
          pokemons: updatedPokemons,
          error: null,
        );

        _currentPage++;
      },
    );
  }

  // 스크롤 끝에서 호출될 메서드
  void loadMore() {
    if (!state.isLoading && _hasMoreData) {
      loadPokemons();
    }
  }

  // 새로고침용 메서드
  void refresh() {
    loadPokemons(refresh: true);
  }
}
