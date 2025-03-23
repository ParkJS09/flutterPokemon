import 'package:core/core.dart';
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

class _PokemonListScreenState extends ConsumerState<PokemonListScreen>
    with SingleTickerProviderStateMixin {
  final _scrollController = ScrollController();

  // 로딩 애니메이션 컨트롤러
  late AnimationController _loadingAnimationController;
  late Animation<double> _loadingAnimation;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(pokemonViewModelProvider.notifier).loadPokemons();
    });

    // 포켓볼 회전 애니메이션 설정
    _loadingAnimationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    )..repeat(); // 계속 반복

    _loadingAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _loadingAnimationController,
        curve: Curves.linear,
      ),
    );
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

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: TextField(
            decoration: InputDecoration(
              hintText: '포켓몬 이름을 입력하세요',
              border: OutlineInputBorder(),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PokeChip(label: '필터'),
            SizedBox(width: 8),
            PokeChip(label: '필터'),
            SizedBox(width: 8),
            PokeChip(label: '필터'),
          ],
        ),
        Expanded(
          child: RefreshIndicator(
            onRefresh: () async {
              ref.read(pokemonViewModelProvider.notifier).refresh();
            },
            child: Stack(
              children: [
                GridView.builder(
                  padding: EdgeInsets.all(AppSpacing.md),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.75,
                    crossAxisSpacing: AppSpacing.md,
                    mainAxisSpacing: AppSpacing.md,
                  ),
                  controller: _scrollController,
                  itemCount: state.pokemons.length,
                  itemBuilder: (context, index) {
                    final pokemon = state.pokemons[index];

                    final typeColor =
                        AppColors.typeColors[pokemon.type.toLowerCase()] ??
                        AppColors.primary;

                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (context) =>
                                    PokemonDetailScreen(id: pokemon.id),
                          ),
                        );
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: typeColor.withValues(alpha: 0.2),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(AppRadius.lg),
                                topRight: Radius.circular(AppRadius.lg),
                              ),
                            ),
                            child: Stack(
                              children: [
                                Positioned(
                                  right: AppSpacing.sm,
                                  top: AppSpacing.sm,
                                  child: Text(
                                    '#${pokemon.id.toString().padLeft(3, '0')}',
                                    style: AppTextStyles.caption.copyWith(
                                      color: typeColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Center(
                                  child: Hero(
                                    tag: 'pokemon-${pokemon.id}',
                                    child: Image.network(
                                      pokemon.imageUrl,
                                      width: 85,
                                      height: 85,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: typeColor.withValues(alpha: 0.5),
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(AppRadius.lg),
                                  bottomRight: Radius.circular(AppRadius.lg),
                                ),
                              ),
                              padding: EdgeInsets.all(AppSpacing.md),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    pokemon.name,
                                    style: AppTextStyles.listTitle.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  SizedBox(height: AppSpacing.xs),
                                  PokeChip.forType(
                                    pokemon.type,
                                    size: WidgetSize.small,
                                  ),
                                  Spacer(),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      _buildStatIndicator(
                                        'ATK',
                                        (pokemon.id % 100) + 50,
                                        AppColors.statAttack,
                                      ),
                                      _buildStatIndicator(
                                        'DEF',
                                        (pokemon.id % 80) + 40,
                                        AppColors.statDefense,
                                      ),
                                      _buildStatIndicator(
                                        'SPD',
                                        (pokemon.id % 120) + 30,
                                        AppColors.statSpeed,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),

                if (state.isLoading)
                  Positioned(
                    left: 0,
                    right: 0,
                    top: 0,
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.white.withValues(alpha: 0),
                            Colors.white.withValues(alpha: 0.5),
                          ],
                        ),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              width: 28,
                              height: 28,
                              child: RotationTransition(
                                turns: _loadingAnimation,
                                child: Image.asset(
                                  'assets/images/pokeball.png',
                                  width: 28,
                                  height: 28,
                                  color: AppColors.primary,
                                  errorBuilder: (context, error, stackTrace) {
                                    print('이미지 로드 실패: $error');
                                    return Icon(
                                      Icons.catching_pokemon,
                                      color: Colors.red,
                                    );
                                  },
                                ),
                              ),
                            ),
                            SizedBox(width: 12),
                            Text(
                              '더 많은 포켓몬 불러오는 중...',
                              style: AppTextStyles.caption.copyWith(
                                color: AppColors.textPrimary,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                if (state.isRefreshing)
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 3,
                      child: LinearProgressIndicator(
                        backgroundColor: Colors.transparent,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          AppColors.primary,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildStatIndicator(String label, int value, Color color) {
    final percentage = value / 200.0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          label,
          style: AppTextStyles.caption.copyWith(fontWeight: FontWeight.w500),
        ),
        SizedBox(height: 4),
        Container(
          width: 28,
          height: 3,
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.2),
            borderRadius: BorderRadius.circular(2),
          ),
          child: FractionallySizedBox(
            alignment: Alignment.centerLeft,
            widthFactor: percentage,
            child: Container(
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _loadingAnimationController.dispose(); // 애니메이션 컨트롤러 해제
    super.dispose();
  }
}
