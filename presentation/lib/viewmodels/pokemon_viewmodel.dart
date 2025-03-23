import 'package:domain/usecases/get_pokemons.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:presentation/states/pokemon_state.dart';

class PokemonViewModel extends StateNotifier<PokemonState> {
  // Pokemon 조회 UseCase
  final GetPokemons getPokemons;
  int _currentPage = 0;
  bool _hasMoreData = true;

  PokemonViewModel({required this.getPokemons})
    : super(PokemonState(pokemons: [], isRefreshing: false, isLoading: false));

  Future<void> loadPokemons({bool refresh = false}) async {
    // 이미 로딩 중이거나, 새로고침이 아닌데 더 이상 데이터가 없는 경우 실행하지 않음
    if ((refresh && state.isRefreshing) ||
        (!refresh && state.isLoading) ||
        (!refresh && !_hasMoreData)) {
      return;
    }

    // 상태 업데이트: 로딩 또는 새로고침 시작
    if (refresh) {
      state = state.copyWith(isRefreshing: true);
      _currentPage = 0;
    } else {
      state = state.copyWith(isLoading: true);
    }

    // 새로고침 시 기존 데이터 초기화
    if (refresh) {
      state = state.copyWith(pokemons: []);
    }

    try {
      final result = await getPokemons(page: _currentPage);

      result.fold(
        (failure) {
          // 에러 발생 시 상태 업데이트
          state = state.copyWith(
            isLoading: false,
            isRefreshing: false,
            error: failure.toString(),
          );
        },
        (newPokemons) {
          // 더 이상 데이터가 없는지 확인
          if (newPokemons.isEmpty) {
            _hasMoreData = false;
          }

          // 새로고침인 경우 새 데이터로 교체, 아니면 기존 데이터에 추가
          final updatedPokemons =
              refresh ? newPokemons : [...state.pokemons, ...newPokemons];

          // 성공 시 상태 업데이트
          state = state.copyWith(
            isLoading: false,
            isRefreshing: false,
            pokemons: updatedPokemons,
            error: null,
            hasMoreData: _hasMoreData,
          );

          _currentPage++;
        },
      );
    } catch (e) {
      // 예상치 못한 에러 처리
      state = state.copyWith(
        isLoading: false,
        isRefreshing: false,
        error: e.toString(),
      );
    }
  }

  // 스크롤 끝에서 호출될 메서드
  void loadMore() {
    if (!state.isLoading && !state.isRefreshing && _hasMoreData) {
      loadPokemons();
    }
  }

  // 새로고침용 메서드
  void refresh() {
    loadPokemons(refresh: true);
  }

  // 로딩/에러 상태 초기화
  void resetError() {
    state = state.copyWith(error: null);
  }

  // 모든 데이터 삭제 및 상태 초기화
  void clearAll() {
    _currentPage = 0;
    _hasMoreData = true;
    state = PokemonState(pokemons: [], isRefreshing: false, isLoading: false);
  }
}
