import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../core/constants/api_url.dart';
import '../../../core/network/dio_client.dart';
import '../../../service_locator.dart';

abstract class TVService {
  Future<Either> getPopularTv();
  Future<Either> getRecommendationTVs(int tvId);
  Future<Either> getSimilarTVs(int tvId);
  Future<Either> getTvTrailer(int tvId); // ✅ واحدة بس زي الموفي
  Future<Either> getKeywords(int tvId);
  Future<Either> searchTV(String query);
}

class TVApiServiceImpl extends TVService {
  @override
  Future<Either> getPopularTv() async {
    try {
      var response = await sl<DioClient>().get(ApiUrl.popularTv);
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response?.data['message'] ?? "Something went wrong");
    }
  }

  @override
  Future<Either> getRecommendationTVs(int tvId) async {
    try {
      var response = await sl<DioClient>().get(
        '${ApiUrl.tv}$tvId/recommendations',
      );
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response?.data['message'] ?? "Something went wrong");
    }
  }

  @override
  Future<Either> getSimilarTVs(int tvId) async {
    try {
      var response = await sl<DioClient>().get(
        '${ApiUrl.tv}$tvId/similar',
      );
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response?.data['message'] ?? "Something went wrong");
    }
  }

  @override
  Future<Either> getTvTrailer(int tvId) async {
    try {
      var response = await sl<DioClient>().get(
        '${ApiUrl.tv}$tvId/trailer', // ✅ زي الموفي بالظبط
      );
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response?.data['message'] ?? "Something went wrong");
    }
  }

  @override
  Future<Either> getKeywords(int tvId) async {
    try {
      var response = await sl<DioClient>().get(
        '${ApiUrl.tv}$tvId/keywords',
      );
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response?.data['message'] ?? "Something went wrong");
    }
  }

  @override
  Future<Either> searchTV(String query) async {
    try {
      var response = await sl<DioClient>().get(
        '${ApiUrl.search}tv/$query',
      );
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }
}
