import 'package:dartz/dartz.dart';

abstract class TvRepository {
  Future<Either> getPopularTv();
  Future<Either> getRecommendationTVs(int tvId);
  Future<Either> getSimilarTVs(int tvId);
  Future<Either> getTvTrailer(int tvId);
  Future<Either> getKeywords(int tvId);
  Future<Either> searchTV(String query);
}
