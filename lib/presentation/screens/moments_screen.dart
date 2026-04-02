import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/moment_bloc.dart';
import '../bloc/moment_event.dart';
import '../bloc/moment_state.dart';
import '../widgets/tweet_widget.dart';

class MomentsScreen extends StatefulWidget {
  const MomentsScreen({super.key});

  @override
  State<MomentsScreen> createState() => _MomentsScreenState();
}

class _MomentsScreenState extends State<MomentsScreen> {
  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    context.read<MomentBloc>().add(FetchMoments());

    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        context.read<MomentBloc>().add(LoadMoreMoments());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Moments")),
      body: BlocBuilder<MomentBloc, MomentState>(
        builder: (context, state) {
          if (state is MomentLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is MomentLoaded) {
            return RefreshIndicator(
              onRefresh: () async {
                context.read<MomentBloc>().add(RefreshMoments());
              },
              child: ListView.builder(
                controller: scrollController,
                itemCount: state.tweets.length,
                itemBuilder: (context, index) {
                  return TweetItem(tweet: state.tweets[index]);
                },
              ),
            );
          } else {
            return Center(child: Text("Error"));
          }
        },
      ),
    );
  }
}
