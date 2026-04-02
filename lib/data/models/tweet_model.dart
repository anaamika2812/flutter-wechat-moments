import '../../domain/entities/tweet.dart';

class TweetModel extends Tweet {
  const TweetModel({
    required super.content,
    required super.images,
    required super.username,
    required super.avatar,
  });

  factory TweetModel.fromJson(Map<String, dynamic> json) {
    return TweetModel(
      content: json['content'] ?? '',
      images:
          (json['images'] as List?)?.map((e) => e['url'] as String).toList() ??
          [],
      username: json['sender']?['nick'] ?? '',
      avatar: json['sender']?['avatar'] ?? '',
    );
  }
}
