import 'package:equatable/equatable.dart';

class Tweet extends Equatable {
  final String content;
  final List<String> images;
  final String username;
  final String avatar;

  const Tweet({
    required this.content,
    required this.images,
    required this.username,
    required this.avatar,
  });

  @override
  List<Object?> get props => [content, images, username, avatar];
}
