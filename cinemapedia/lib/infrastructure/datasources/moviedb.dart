import 'package:dio/dio.dart';

import 'package:cinemapedia/config/constants/enviroment.dart';
import 'package:cinemapedia/domain/datasources/movies.dart';
import 'package:cinemapedia/domain/entities/movie.dart';



class MoviedbDatasource extends MoviesDataSource {

  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      queryParameters: {
        'api_key': Enviroment.theMovieDbKey,
        'languaje': 'es-MX'
      }
    )
  );

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {

    final response = await dio.get('/movie/now_playing');
    final List<Movie> movies = [];

    return movies;
  }

}