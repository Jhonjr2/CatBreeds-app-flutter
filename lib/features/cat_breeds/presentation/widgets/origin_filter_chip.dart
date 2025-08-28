import 'package:prueba_tecnica/features/cat_breeds/presentation/bloc/cat_breeds_bloc.dart';
import 'package:prueba_tecnica/features/cat_breeds/presentation/bloc/cat_breeds_event.dart';
import 'package:prueba_tecnica/features/cat_breeds/presentation/bloc/cat_breeds_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OriginFilterChips extends StatelessWidget {
  const OriginFilterChips({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CatBreedsBloc, CatBreedsState>(
      builder: (context, state) {
        if (state is! CatBreedsLoaded) return const SizedBox.shrink();

        final origins = state.breeds
            .map((e) => e.origin)
            .whereType<String>()
            .toSet()
            .toList()
          ..sort();

        if (origins.isEmpty) return const SizedBox.shrink();

        return SizedBox(
          height: 50,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            children: [
              // Botón "Todos"
              Container(
                margin: const EdgeInsets.only(right: 12),
                child: FilterChip(
                  label: const Text(
                    'Todos',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  selected: state.filterOrigin == null,
                  selectedColor: const Color(0xFF667eea),
                  backgroundColor: Colors.white.withOpacity(0.9),
                  checkmarkColor: Colors.white,
                  onSelected: (_) {
                    context.read<CatBreedsBloc>().add(const FilterByOrigin(null));
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: BorderSide(
                      color: state.filterOrigin == null 
                          ? const Color(0xFF667eea) 
                          : Colors.grey.withOpacity(0.3),
                      width: 1,
                    ),
                  ),
                  labelStyle: TextStyle(
                    color: state.filterOrigin == null ? Colors.white : const Color(0xFF667eea),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              // Filtros por país
              ...origins.map((origin) {
                final isSelected = state.filterOrigin == origin;
                return Container(
                  margin: const EdgeInsets.only(right: 12),
                  child: FilterChip(
                    label: Text(
                      origin,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    selected: isSelected,
                    selectedColor: const Color(0xFFf093fb),
                    backgroundColor: Colors.white.withOpacity(0.9),
                    checkmarkColor: Colors.white,
                    onSelected: (_) {
                      context.read<CatBreedsBloc>().add(FilterByOrigin(origin));
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(
                        color: isSelected 
                            ? const Color(0xFFf093fb) 
                            : Colors.grey.withOpacity(0.3),
                        width: 1,
                      ),
                    ),
                    labelStyle: TextStyle(
                      color: isSelected ? Colors.white : const Color(0xFFf093fb),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                );
              }),
            ],
          ),
        );
      },
    );
  }
}