import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../bloc/trailer_cubit.dart';
import '../bloc/trailer_state.dart';

enum TrailerType { movie, tv }

class VideoPlayer extends StatelessWidget {
  final int id;
  final TrailerType type;

  const VideoPlayer({
    super.key,
    required this.id,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final cubit = TrailerCubit();
        if (type == TrailerType.movie) {
          cubit.getMovieTrailer(id);
        } else {
          cubit.getTvTrailer(id);
        }
        return cubit;
      },
      child: BlocBuilder<TrailerCubit, TrailerState>(
        builder: (context, state) {
          if (state is TrailerLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is TrailerLoaded) {
            return YoutubePlayer(
              controller: state.youtubePlayerController,
              showVideoProgressIndicator: true,
            );
          }
          if (state is FailuerLoadTrailer) {
            return Center(child: Text(state.errorMessage));
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
