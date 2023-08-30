import 'package:cinemapedia/domain/entities/movie.dart';

abstract class MovieRepository {

  Future<Movie> getNowPlaying({ int page = 1});

}