import 'package:flutter/material.dart';
import 'package:netflix/presentation/watch/widgets/recommendation_movies.dart';
import 'package:netflix/presentation/watch/widgets/video_overview.dart';
import 'package:netflix/presentation/watch/widgets/video_release_date.dart';
import 'package:netflix/presentation/watch/widgets/video_title.dart';
import 'package:netflix/presentation/watch/widgets/video_vote_average.dart';

import '../../../commen/widgets/appbar/app_bar.dart';
import '../../../domain/movie/entities/movie.dart';
import '../widgets/similar_movies.dart';
import '../widgets/video_player.dart';

class MovieWatchPage extends StatelessWidget {
  final MovieEntity movieEntity;
  const MovieWatchPage({super.key, required this.movieEntity});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppbar(hideBack: false),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          VideoPlayer(
            id: movieEntity.id!,
            type: TrailerType.movie,
          ),
          const SizedBox(height: 12),
          VideoTitle(title: movieEntity.title!),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              VideoReleaseDate(releaseDate: movieEntity.releaseDate!),
              VideoVoteAverage(voteAverage: movieEntity.voteAverage!)
            ],
          ),
          const SizedBox(height: 16),
          VideoOverview(overview: movieEntity.overview!),
          const SizedBox(height: 16),
          RecommendationMovies(movieId: movieEntity.id!),
          const SizedBox(height: 16),
          SimilarMovies(movieId: movieEntity.id!)
        ]),
      ),
    );
  }
}
