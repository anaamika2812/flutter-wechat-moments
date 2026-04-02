import '../../domain/entities/tweet.dart';

abstract class MomentState {}

class MomentLoading extends MomentState {}

class MomentLoaded extends MomentState {
  final List<Tweet> tweets;

  MomentLoaded(this.tweets);
}

class MomentError extends MomentState {}
