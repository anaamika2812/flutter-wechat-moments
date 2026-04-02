import '../entities/tweet.dart';
import '../repositories/moment_repository.dart';

class GetMoments {
  final MomentRepository repository;

  GetMoments(this.repository);

  Future<List<Tweet>> call() async {
    return await repository.getMoments();
  }
}
