import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/get_moments.dart';
import '../../domain/entities/tweet.dart';
import 'moment_event.dart';
import 'moment_state.dart';

class MomentBloc extends Bloc<MomentEvent, MomentState> {
  final GetMoments getMoments;

  List<Tweet> all = [];
  int page = 1;

  MomentBloc(this.getMoments) : super(MomentLoading()) {
    on<FetchMoments>((event, emit) async {
      try {
        final data = await getMoments();

        all = data;

        emit(MomentLoaded(all.take(5).toList()));
      } catch (_) {
        emit(MomentError());
      }
    });

    on<LoadMoreMoments>((event, emit) {
      page++;

      emit(MomentLoaded(all.take(page * 5).toList()));
    });

    on<RefreshMoments>((event, emit) {
      page = 1;

      emit(MomentLoaded(all.take(5).toList()));
    });
  }
}
