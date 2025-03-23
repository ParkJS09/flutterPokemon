import 'package:domain/entities/pokemon.dart';

class PokemonState {
  final List<Pokemon> pokemons;
  final bool isLoading; // 추가 데이터 로딩 중
  final bool isRefreshing; // 데이터 새로고침 중
  final String? error; // 오류 메시지
  final bool hasMoreData; // 더 로드할 데이터가 있는지 여부

  PokemonState({
    required this.pokemons,
    required this.isLoading,
    required this.isRefreshing,
    this.error,
    this.hasMoreData = true,
  });

  // 상태 복사 메서드
  PokemonState copyWith({
    List<Pokemon>? pokemons,
    bool? isLoading,
    bool? isRefreshing,
    String? error,
    bool? hasMoreData,
  }) {
    return PokemonState(
      pokemons: pokemons ?? this.pokemons,
      isLoading: isLoading ?? this.isLoading,
      isRefreshing: isRefreshing ?? this.isRefreshing,
      error: error, // null을 전달하면 에러 상태를 지울 수 있도록 null 허용
      hasMoreData: hasMoreData ?? this.hasMoreData,
    );
  }
}
