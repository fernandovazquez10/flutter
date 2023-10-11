import 'package:cinemapedia/config/helpers/human_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:cinemapedia/presentation/widgets/widgets.dart';


class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends ConsumerState<HomeView> {
  @override
  void initState() {
    super.initState();

    initializeDateFormatting();
    ref.read( nowPlayingMoviesProvider.notifier ).loadNextPage();
    ref.read( popularMoviesProvider.notifier ).loadNextPage();
    ref.read( topRatedMoviesProvider.notifier ).loadNextPage();
    ref.read( upComingMoviesProvider.notifier ).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {

    final initialLoading = ref.watch( initialLoadingProvider );
    if (initialLoading) return const FullScreenLoader();

    final moviesSlideshow = ref.watch( moviesSlideshowProvider );
    final nowPlayingMovies = ref.watch( nowPlayingMoviesProvider );
    final topRatedMovies = ref.watch( topRatedMoviesProvider );
    final upComingMovies = ref.watch( upComingMoviesProvider );

    
    final DateTime now = DateTime.now();
    final String today = HumanFormat.spanishDate( DateFormat.MMMMEEEEd('es_MX').format(now) );
    final String thisMonth = HumanFormat.spanishDate(  DateFormat.MMMM('es_MX').format(now) );

    return CustomScrollView(slivers: [
      
      const SliverAppBar(
        floating: true,
        flexibleSpace: FlexibleSpaceBar(
          title: CustomAppbar(),
          centerTitle: true,
        ),
      ),

      SliverList(
        delegate: SliverChildBuilderDelegate((context, index) {
          return Column(
            children: [
              
              MoviesSlideshow(
                movies: moviesSlideshow
              ),
              MovieHorizontalListview(
                movies: nowPlayingMovies,
                title: 'En cines',
                subTitle: today,
                loadNextPage: () {
                  ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
                },
              ),
              MovieHorizontalListview(
                movies: upComingMovies,
                title: 'Proximamente',
                subTitle: thisMonth,
                loadNextPage: () {
                  ref.read(upComingMoviesProvider.notifier).loadNextPage();
                },
              ),
              MovieHorizontalListview(
                movies: topRatedMovies,
                title: 'Mejor calificadas',
                subTitle: 'Siempre',
                loadNextPage: () {
                  ref.read( topRatedMoviesProvider.notifier ).loadNextPage();
                },
              ),
              const SizedBox(height: 20)
            ],
          );
        },
        childCount: 1)
      )
    ]);
  }
}

