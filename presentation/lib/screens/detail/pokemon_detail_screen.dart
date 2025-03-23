import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:presentation/providers/pokemon_providers.dart';

class PokemonDetailScreen extends ConsumerWidget {
  final int id;
  const PokemonDetailScreen({required this.id});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pokemon = ref
        .watch(pokemonViewModelProvider)
        .pokemons
        .firstWhere((pokemon) => pokemon.id == id);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            flexibleSpace: Hero(
              tag: 'pokemon-${pokemon.id}',
              child: Image.network(pokemon.imageUrl),
            ),
          ),
        ],
      ),
    );
  }
}
