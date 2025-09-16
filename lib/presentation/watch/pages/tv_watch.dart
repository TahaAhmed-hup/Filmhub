import 'package:flutter/material.dart';

import '../../../commen/widgets/appbar/app_bar.dart';
import '../../../domain/tv/entities/tv.dart';
import '../widgets/recommendation_tvs.dart';
import '../widgets/similar_tvs.dart';
import '../widgets/tv_keywords.dart';
import '../widgets/video_overview.dart';
import '../widgets/video_player.dart';
import '../widgets/video_title.dart';
import '../widgets/video_vote_average.dart';

class TVWatchPage extends StatelessWidget {
  final TVEntity tvEntity;
  const TVWatchPage({super.key, required this.tvEntity});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppbar(hideBack: false),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          VideoPlayer(
            id: tvEntity.id!,
            type: TrailerType.tv,
          ),
          const SizedBox(height: 12),
          VideoTitle(title: tvEntity.name!),
          const SizedBox(height: 12),
          TVKeywords(tvId: tvEntity.id!),
          const SizedBox(height: 12),
          VideoVoteAverage(voteAverage: tvEntity.voteAverage!),
          const SizedBox(height: 16),
          VideoOverview(overview: tvEntity.overview!),
          const SizedBox(height: 16),
          RecommendationTvs(tvId: tvEntity.id!),
          const SizedBox(height: 16),
          SimilarTVs(tvId: tvEntity.id!)
        ]),
      ),
    );
  }
}
