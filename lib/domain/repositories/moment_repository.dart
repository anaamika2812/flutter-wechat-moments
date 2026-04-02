import '../entities/tweet.dart';

abstract class MomentRepository {
  Future<List<Tweet>> getMoments();
}
