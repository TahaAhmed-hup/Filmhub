import 'package:dartz/dartz.dart';
import 'package:netflix/commen/helpers/mapper/keyword.dart';
import 'package:netflix/core/models/keyword.dart';
import 'package:netflix/data/tv/models/tv.dart';

import '../../../commen/helpers/mapper/tv_mapper.dart';
import '../../../core/entity/trailer.dart';
import '../../../core/models/trailer.dart';
import '../../../domain/tv/repositories/tv.dart';

import '../../../service_locator.dart';
import '../sources/tv.dart';

class TVRepositoryImpl extends TvRepository {
  @override
  Future<Either> getPopularTv() async {
    var returnedData = await sl<TVService>().getPopularTv();

    return returnedData.fold(
      (error) => Left(error),
      (data) {
        var tvs = List.from(data['content'])
            .map((item) => TvMapper.toEntity(TVModel.fromJson(item)))
            .toList();
        return Right(tvs);
      },
    );
  }

  @override
  Future<Either> getRecommendationTVs(int tvId) async {
    var returnedData = await sl<TVService>().getRecommendationTVs(tvId);

    return returnedData.fold(
      (error) => Left(error),
      (data) {
        var tvs = List.from(data['content'])
            .map((item) => TvMapper.toEntity(TVModel.fromJson(item)))
            .toList();
        return Right(tvs);
      },
    );
  }

  @override
  Future<Either> getSimilarTVs(int tvId) async {
    var returnedData = await sl<TVService>().getSimilarTVs(tvId);

    return returnedData.fold(
      (error) => Left(error),
      (data) {
        var tvs = List.from(data['content'])
            .map((item) => TvMapper.toEntity(TVModel.fromJson(item)))
            .toList();
        return Right(tvs);
      },
    );
  }

  @override
  Future<Either> getTvTrailer(int tvId) async {
    var returnedData = await sl<TVService>().getTvTrailer(tvId);

    return returnedData.fold(
      (error) => Left(error),
      (data) {
        // هنا الباك إند بيرجع { success: true, trailer: {...} }
        var trailer = TrailerModel.fromJson(data['trailer']);
        return Right(TrailerEntity(
          iso6391: trailer.iso6391,
          iso31661: trailer.iso31661,
          name: trailer.name,
          key: trailer.key,
          site: trailer.site,
          size: trailer.size,
          type: trailer.type,
          official: trailer.official,
          publishedAt: trailer.publishedAt,
          id: trailer.id,
        ));
      },
    );
  }

  @override
  Future<Either> getKeywords(int tvId) async {
    var returnedData = await sl<TVService>().getKeywords(tvId);

    return returnedData.fold(
      (error) => Left(error),
      (data) {
        var tvs = List.from(data['content'])
            .map((item) => KeywordMapper.toEntity(KeywordModel.fromJson(item)))
            .toList();
        return Right(tvs);
      },
    );
  }

  @override
  Future<Either> searchTV(String query) async {
    var returnedData = await sl<TVService>().searchTV(query);

    return returnedData.fold(
      (error) => Left(error),
      (data) {
        var tvs = List.from(data['content'])
            .map((item) => TvMapper.toEntity(TVModel.fromJson(item)))
            .toList();
        return Right(tvs);
      },
    );
  }
}
