import '../../domain/entities/tweet.dart';
import '../../domain/repositories/moment_repository.dart';
import '../datasources/moment_remote_datasource.dart';
import '../models/tweet_model.dart';

class MomentRepositoryImpl implements MomentRepository {
  final MomentRemoteDataSource remoteDataSource;

  MomentRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<Tweet>> getMoments() async {
    final data = await remoteDataSource.fetchMoments();

    return data
        .where((e) => e['sender'] != null)
        .map<Tweet>((e) => TweetModel.fromJson(e))
        .toList();
  }
}
