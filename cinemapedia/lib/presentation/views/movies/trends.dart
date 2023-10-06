import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/presentation/providers/movies/movies.dart';
import 'package:cinemapedia/presentation/widgets/movies/movie_masonry.dart';


class TrendsView extends ConsumerStatefulWidget {
  const TrendsView({super.key});

  @override
  TrendsViewState createState() => TrendsViewState();
}


class TrendsViewState extends ConsumerState<TrendsView> {

  @override
  Widget build(BuildContext context) {

    final List<Movie> popularMovies = ref.watch( popularMoviesProvider );

    if ( popularMovies.isEmpty ) {
      return const Center(child: CircularProgressIndicator(strokeWidth: 2));
    }

    return Scaffold(
      body: MovieMasonry(
        loadNextPage: () => ref.read( popularMoviesProvider.notifier ).loadNextPage(),
        movies: popularMovies,
      ),
    );
  }
}
