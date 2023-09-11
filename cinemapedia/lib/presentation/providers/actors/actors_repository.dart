import 'package:flutter_riverpod/flutter_riverpod.dart';


import 'package:cinemapedia/infrastructure/datasources/actor_moviedb.dart';
import 'package:cinemapedia/infrastructure/repositories/actor_impl.dart';

// Provider only read
final actorsRepositoryProvider = Provider((ref) {
  return ActorRepositoryImpl( ActorMovieDbDatasource() );
});
