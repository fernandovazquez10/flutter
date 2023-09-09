import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/presentation/providers/movies/movie_details.dart';


class MovieScreen extends ConsumerStatefulWidget {

  static const name = 'movie-screen';

  final String movieId;

  const MovieScreen({super.key, required this.movieId});

  @override
  MovieScreenState createState() => MovieScreenState();
}

class MovieScreenState extends ConsumerState<MovieScreen> {

  @override
  void initState(){
    super.initState();

    ref.read( movieDetailsProvider.notifier ).loadMovie(widget.movieId);

  }

  @override
  Widget build(BuildContext context) {

    final Movie? movie = ref.watch( movieDetailsProvider )[widget.movieId];

    if (movie == null){
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(strokeWidth: 2),
        ),
      );
    }

    return Scaffold(
      body: CustomScrollView(
        physics: const ClampingScrollPhysics(),
        slivers: [
          _CustomSliverAppBar(movie: movie),
          
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => _MovieDetails(movie: movie),
              childCount: 1,
            ),
          ),

        ],
      )
    );
  }
}


class _MovieDetails extends StatelessWidget {
  
  final Movie movie; 

  const _MovieDetails({ required this.movie });

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final textStyle = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(18),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              SizedBox(
                width: size.width - 36,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(movie.title, style: textStyle.titleLarge),
                    Text(movie.overview)
                  ],
                ),
              )
            ],
          ),
        ),
        // Generos de la pelicula
        Padding(
          padding: const EdgeInsets.all(8),
          child: Wrap(
            children: [
              ...movie.genreIds.map((gender) => Container(
                margin: const EdgeInsets.all(10),
                child: Chip(
                  label: Text(gender),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                ),
              ))
            ],
          ),
        ),

        // TODO: Mostrar actores
        const SizedBox(height: 100),
      ],
    );
  }
}


class _CustomSliverAppBar extends StatelessWidget {
  
  final Movie movie;
  
  const _CustomSliverAppBar({
    required this.movie
    });

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return SliverAppBar(
      backgroundColor: Colors.black,
      expandedHeight: size.height * 0.7,
      foregroundColor: Colors.white,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        background: Stack(
          children: [
            SizedBox.expand(
              child: Image.network(
                movie.posterPath,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox.expand(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0, 0.15],
                    colors: [
                      Colors.black54,
                      Colors.transparent,
                    ]
                  )
                )
              ),
            )
          ],
        ),
      ),
    );
  }
}
