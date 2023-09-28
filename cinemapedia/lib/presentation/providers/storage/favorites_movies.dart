
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/domain/repositories/local_storage.dart';
import 'package:cinemapedia/presentation/providers/providers.dart';

final favoriteMoviesProvider = StateNotifierProvider<StorageMoviesNotifier, Map<int, Movie>>((ref) {
  final localStorageRepository = ref.watch( localStorageRepositoryProvider );

  return StorageMoviesNotifier(localStorageRepository: localStorageRepository);

});


class StorageMoviesNotifier extends StateNotifier<Map<int, Movie>> {

  int page = 0;
  final LocalStorageRepository localStorageRepository;

  StorageMoviesNotifier({
    required this.localStorageRepository,
  }): super({});


  Future<List<Movie>> loadNextPage() async {
    final movies = await localStorageRepository.loadMovies(offset: page * 10 ); // TODO: Limit 20
    page++;

    final tempMoviesMap = <int, Movie>{};

    for (final movie in movies ) {
      tempMoviesMap[movie.id] = movie;
    }

    state = { ...state, ...tempMoviesMap };


    return movies;
  }

}
