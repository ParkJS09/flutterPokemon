import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:presentation/providers/pokemon_providers.dart';
import 'package:presentation/screens/detail/pokemon_detail_screen.dart';
import 'package:presentation/states/pokemon_state.dart';

class PokemonListScreen extends ConsumerStatefulWidget {
  @override
  _PokemonListScreenState createState() => _PokemonListScreenState();
}

class _PokemonListScreenState extends ConsumerState<PokemonListScreen> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(pokemonViewModelProvider.notifier).loadPokemons();
    });
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      ref.read(pokemonViewModelProvider.notifier).loadMore();
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(pokemonViewModelProvider);

    return Scaffold(
      appBar: AppBar(title: Text('포켓몬 도감')),
      body: _buildBody(state),
    );
  }

  Widget _buildBody(PokemonState state) {
    if (state.error != null) {
      return Center(child: Text(state.error!));
    }

    return RefreshIndicator(
      onRefresh: () async {
        ref.read(pokemonViewModelProvider.notifier).refresh();
      },
      child: ListView.builder(
        controller: _scrollController,
        itemCount: state.pokemons.length + (state.isLoading ? 1 : 0),
        itemBuilder: (context, index) {
          if (index == state.pokemons.length) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(
                      width: 24,
                      height: 24,
                      child: CircularProgressIndicator(
                        strokeWidth: 2.5,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '포켓몬을 불러오는 중...',
                      style: Theme.of(
                        context,
                      ).textTheme.bodySmall?.copyWith(color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),
            );
          }

          // 포켓몬 아이템 UI도 개선
          final pokemon = state.pokemons[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            elevation: 2,
            child: ListTile(
              contentPadding: const EdgeInsets.all(12),
              leading: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Hero(
                  tag: 'pokemon-${pokemon.id}',
                  child: Center(child: Image.network(pokemon.imageUrl)),
                ),
              ),
              title: Text(
                pokemon.name,
                style: Theme.of(
                  context,
                ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                pokemon.type,
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(color: Colors.grey[600]),
              ),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                // 상세 페이지로 이동
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PokemonDetailScreen(id: pokemon.id),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
