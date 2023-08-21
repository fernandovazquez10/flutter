
import 'package:shorts/domain/datasources/video_post.dart';
import 'package:shorts/domain/entities/video_post.dart';
import 'package:shorts/infrastructure/models/local_video.dart';
import 'package:shorts/shared/data/local_video_post.dart';

class LocalVideoPostDatasource implements VideoPostDataSource {


  @override
  Future<List<VideoPost>> getFavoriteVideosByUser(int userID) {
    throw UnimplementedError();
  }

  @override
  Future<List<VideoPost>> getTrendingVideosByPage(int page) async {
    await Future.delayed( const Duration(seconds: 2));

    final List<VideoPost> newVideos = videoPosts.map(
      (video) => LocalVideoModel.fromJson(video).toVideoPostEntity()
    ).toList();

    return newVideos;
  }

}
