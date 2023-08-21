
import 'package:shorts/domain/datasources/video_post.dart';
import 'package:shorts/domain/entities/video_post.dart';
import 'package:shorts/domain/repositories/video_post.dart';

class VideoPostRepositoryImpl implements VideoPostRepository {

  final VideoPostDataSource videosDatasource;

  VideoPostRepositoryImpl({
    required this.videosDatasource,
  });
  
  @override
  Future<List<VideoPost>> getFavoriteVideosByUser(int userID) {
    throw UnimplementedError();
  }

  @override
  Future<List<VideoPost>> getTrendingVideosByPage(int page) {
    return videosDatasource.getTrendingVideosByPage(page);
  }

}
