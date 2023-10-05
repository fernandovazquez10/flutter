import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

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

    // initializeDateFormatting(); Todo: Capitalize for spanish
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
    // final popularMovies = ref.watch( popularMoviesProvider );
    final topRatedMovies = ref.watch( topRatedMoviesProvider );
    final upComingMovies = ref.watch( upComingMoviesProvider );

    
    final DateTime now = DateTime.now();
    final String today = DateFormat.MMMMEEEEd('en_US').format(now);
    final String thisMonth = DateFormat.MMMM('en_US').format(now);

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
              
              MoviesSlideshow(movies: moviesSlideshow),
              MovieHorizontalListview(
                movies: nowPlayingMovies,
                title: 'In theaters',
                subTitle: today,
                loadNextPage: () {
                  ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
                },
              ),
              MovieHorizontalListview(
                movies: upComingMovies,
                title: 'Up coming',
                subTitle: thisMonth,
                loadNextPage: () {
                  ref.read(upComingMoviesProvider.notifier).loadNextPage();
                },
              ),
              // MovieHorizontalListview(
              //  movies: popularMovies,
              //  title: 'Popular',
              //  loadNextPage: () {
              //    ref.read(popularMoviesProvider.notifier).loadNextPage();
              //  },
              // ),
              MovieHorizontalListview(
                movies: topRatedMovies,
                title: 'Top rating',
                subTitle: 'All times',
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

