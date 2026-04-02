import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../domain/entities/tweet.dart';

class TweetItem extends StatelessWidget {
  final Tweet tweet;

  const TweetItem({super.key, required this.tweet});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: CachedNetworkImageProvider(tweet.avatar),
                ),
                SizedBox(width: 10),
                Text(tweet.username),
              ],
            ),
            SizedBox(height: 10),
            if (tweet.content.isNotEmpty) Text(tweet.content),
            Wrap(
              spacing: 5,
              children: tweet.images
                  .map(
                    (e) => CachedNetworkImage(
                      imageUrl: e,
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
