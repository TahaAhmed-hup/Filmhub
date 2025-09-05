import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/presentation/watch/bloc/trailer_state.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../core/entity/trailer.dart';
import '../../../domain/movie/usecases/get_movie_trailer.dart';
import '../../../domain/tv/usecases/get_tv_trailer.dart';
import '../../../service_locator.dart';

class TrailerCubit extends Cubit<TrailerState> {
  TrailerCubit() : super(TrailerLoading());

  Future<void> getMovieTrailer(int movieID) async {
    await _loadTrailer(
        () => sl<GetMovieTrailerUseCase>().call(params: movieID));
  }

  Future<void> getTvTrailer(int tvID) async {
    await _loadTrailer(() => sl<GetTvTrailerUseCase>().call(params: tvID));
  }

  Future<void> _loadTrailer(Future<dynamic> Function() fetchTrailer) async {
    emit(TrailerLoading());
    var returnedData = await fetchTrailer();

    returnedData.fold(
      (error) {
        emit(FailuerLoadTrailer(errorMessage: error));
      },
      (data) async {
        TrailerEntity trailerEntity = data;
        YoutubePlayerController controller = YoutubePlayerController(
          initialVideoId: trailerEntity.key!,
          flags: const YoutubePlayerFlags(autoPlay: false),
        );
        emit(TrailerLoaded(youtubePlayerController: controller));
      },
    );
  }
}
