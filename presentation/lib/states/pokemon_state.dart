import 'package:domain/entities/pokemon.dart';

class PokemonState {
  final List<Pokemon> pokemons;
  final bool isLoading;
  final String? error;

  PokemonState({required this.pokemons, required this.isLoading, this.error});

  PokemonState copyWith({
    List<Pokemon>? pokemons,
    bool? isLoading,
    String? error,
  }) {
    return PokemonState(
      pokemons: pokemons ?? this.pokemons,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}
