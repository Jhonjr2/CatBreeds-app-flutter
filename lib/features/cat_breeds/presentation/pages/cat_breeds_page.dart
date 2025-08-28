import 'package:prueba_tecnica/core/utils/screen_util.dart';
import 'package:prueba_tecnica/features/cat_breeds/presentation/bloc/cat_breeds_bloc.dart';
import 'package:prueba_tecnica/features/cat_breeds/presentation/bloc/cat_breeds_event.dart';
import 'package:prueba_tecnica/features/cat_breeds/presentation/bloc/cat_breeds_state.dart';
import 'package:prueba_tecnica/features/cat_breeds/presentation/pages/cat_breed_detail_page.dart';
import 'package:prueba_tecnica/features/cat_breeds/presentation/widgets/cat_breed_card.dart';
import 'package:prueba_tecnica/features/cat_breeds/presentation/widgets/origin_filter_chip.dart';
import 'package:prueba_tecnica/core/di/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CatBreedsPage extends StatelessWidget {
  const CatBreedsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<CatBreedsBloc>()..add(LoadCatBreeds()),
      child: const CatBreedsContent(),
    );
  }
}

class CatBreedsContent extends StatelessWidget {
  const CatBreedsContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF667eea),
              Color(0xFF764ba2),
              Color(0xFFf093fb),
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Header con título y búsqueda
              Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    // Título principal
                    const Text(
                      'Catbreeds',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        letterSpacing: 1.5,
                        shadows: [
                          Shadow(
                            offset: Offset(2, 2),
                            blurRadius: 4,
                            color: Colors.black26,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Descubre las razas más fascinantes',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white70,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Barra de búsqueda
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 10,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              decoration: const InputDecoration(
                                hintText: 'Buscar razas de gatos...',
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 15,
                                ),
                              ),
                              onSubmitted: (query) {
                                if (query.isNotEmpty) {
                                  context.read<CatBreedsBloc>().add(SearchBreeds(query));
                                }
                              },
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(15),
                            decoration: const BoxDecoration(
                              color: Color(0xFF667eea),
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(25),
                                bottomRight: Radius.circular(25),
                              ),
                            ),
                            child: const Icon(
                              Icons.search,
                              color: Colors.white,
                              size: 24,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // Filtros de origen
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: const OriginFilterChips(),
              ),
              const SizedBox(height: 20),
              // Lista de razas
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                    child: BlocBuilder<CatBreedsBloc, CatBreedsState>(
                      builder: (context, state) {
                        if (state is CatBreedsLoading) {
                          return const Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    Color(0xFF667eea),
                                  ),
                                ),
                                SizedBox(height: 16),
                                Text(
                                  'Cargando razas de gatos...',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          );
                        } else if (state is CatBreedsError) {
                          return Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.error_outline,
                                  size: 64,
                                  color: Colors.red[300],
                                ),
                                const SizedBox(height: 16),
                                Text(
                                  state.message,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 20),
                                ElevatedButton(
                                  onPressed: () {
                                    context.read<CatBreedsBloc>().add(LoadCatBreeds());
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFF667eea),
                                    foregroundColor: Colors.white,
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 24,
                                      vertical: 12,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  child: const Text('Reintentar'),
                                ),
                              ],
                            ),
                          );
                        } else if (state is CatBreedsLoaded) {
                          if (state.filteredBreeds.isEmpty) {
                            return Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.search_off,
                                    size: 64,
                                    color: Colors.grey[400],
                                  ),
                                  const SizedBox(height: 16),
                                  const Text(
                                    'No se encontraron razas',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  const Text(
                                    'Intenta con otros filtros o términos de búsqueda',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            );
                          }
                          return RefreshIndicator(
                            onRefresh: () async {
                              context.read<CatBreedsBloc>().add(LoadCatBreeds());
                            },
                            color: const Color(0xFF667eea),
                            child: GridView.builder(
                              padding: const EdgeInsets.all(20),
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: ScreenUtil.isTablet ? 3 : 2,
                                childAspectRatio: 0.8,
                                crossAxisSpacing: 16,
                                mainAxisSpacing: 16,
                              ),
                              itemCount: state.filteredBreeds.length,
                              itemBuilder: (context, index) {
                                final breed = state.filteredBreeds[index];
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => CatBreedDetailPage(breed: breed),
                                      ),
                                    );
                                  },
                                  child: CatBreedCard(breed: breed),
                                );
                              },
                            ),
                          );
                        }
                        return const Center(
                          child: Text(
                            'Desliza hacia abajo para cargar las razas',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CatBreedsSearchDelegate extends SearchDelegate<String> {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    context.read<CatBreedsBloc>().add(SearchBreeds(query));
    return const SizedBox.shrink();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const SizedBox.shrink();
  }
}
