import 'package:flutter/material.dart';
import 'package:shorts/domain/entities/video_post.dart';
import 'package:shorts/infrastructure/models/local_video.dart';
import 'package:shorts/shared/data/local_video_post.dart';

class DiscoverProvider extends ChangeNotifier {

  // TODO: Repository, DataSource

  bool initialLoading = true;
  List<VideoPost> videos = [];

  Future<void> loadNextPage() async {
    
    await Future.delayed(
      const Duration(seconds: 2)
    );
    
    final List<VideoPost> newVideos = videoPosts.map(
      (video) => LocalVideoModel.fromJson(video).toVideoPostEntity()
    ).toList();

    

    videos.addAll( newVideos );
    initialLoading = false;
    notifyListeners();
  }

}