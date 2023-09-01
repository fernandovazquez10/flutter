

import 'package:cinemapedia/domain/datasources/movies.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/domain/repositories/movie.dart';

class MovieRepositoryImpl extends MoviesRepository {

  final MoviesDataSource datasource;

  MovieRepositoryImpl(this.datasource);

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) {
    
    return datasource.getNowPlaying(page: page);
  }

}