import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:cinemapedia/presentation/widgets/widgets.dart';


class FavoritesView extends ConsumerStatefulWidget {
  const FavoritesView({super.key});

  @override
  FavoritesViewState createState() => FavoritesViewState();
}

class FavoritesViewState extends ConsumerState<FavoritesView> {

  bool isLastPage = false;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    loadNextPage();
  }

  void loadNextPage() async {
    if ( isLastPage || isLoading ) return;
    isLoading = true;

    final movies = await ref.read( favoriteMoviesProvider.notifier ).loadNextPage();
    isLoading = false;

    if (movies.isEmpty) {
      isLastPage = true;
    }

  }

  @override
  Widget build(BuildContext context) {

    final List<Movie> favoritesMovies = ref.watch( favoriteMoviesProvider ).values.toList();

    if ( favoritesMovies.isEmpty ) {
      final colors = Theme.of(context).colorScheme;
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon( Icons.heart_broken_sharp, size: 60, color: colors.primary ),
            Text( 'Ohhh no!!', style: TextStyle(fontSize: 30, color: colors.primary)),
            const Text('No tienes peliculas favoritas', style: TextStyle( fontSize: 20, color: Colors.black45)),
            
            const SizedBox(height: 28),

            FilledButton.tonal(
              onPressed: ()=> context.go('/home/0'), 
              child: const Text('Empieza a buscar', style: TextStyle(color: Colors.black54)),
            )
          ],
        ),
      );
    }

    return Scaffold(
      body: MovieMasonry(
        loadNextPage: loadNextPage,
        movies: favoritesMovies
      )
    );
  }
}
