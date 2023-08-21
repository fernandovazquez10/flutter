import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shorts/config/theme/app.dart';
import 'package:shorts/infrastructure/datasources/local_video_post_impl.dart';
import 'package:shorts/infrastructure/repositories/video_posts_repository.dart';
import 'package:shorts/presentation/screens/discover/discover.dart';
import 'package:shorts/providers/discover.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    final videoPostRepository = VideoPostRepositoryImpl(
      videosDatasource: LocalVideoPostDatasource()
    );

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          lazy: false,
          create: (_) => DiscoverProvider(
            videosRepository: videoPostRepository
          )..loadNextPage(),
        )
      ],
      child: MaterialApp(
        title: 'Shorts',
        debugShowCheckedModeBanner: false,
        theme: AppTheme().getTheme(),
        home: const DiscoverScreen(),
      ),
    );
  }
}