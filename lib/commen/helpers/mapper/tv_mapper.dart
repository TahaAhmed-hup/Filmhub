import '../../../core/entity/trailer.dart';
import '../../../core/models/trailer.dart';
import '../../../data/tv/models/tv.dart';
import '../../../domain/tv/entities/tv.dart';

class TvMapper {
  static TVEntity toEntity(TVModel tvModel) {
    return TVEntity(
      adult: tvModel.adult,
      backdropPath: tvModel.backdropPath,
      genreIds: tvModel.genreIds,
      id: tvModel.id,
      originCountry: tvModel.originCountry,
      originalLanguage: tvModel.originalLanguage,
      originalName: tvModel.originalName,
      overview: tvModel.overview,
      popularity: tvModel.popularity,
      posterPath: tvModel.posterPath,
      firstAirDate: tvModel.firstAirDate,
      name: tvModel.name,
      voteAverage: tvModel.voteAverage,
      voteCount: tvModel.voteCount,
    );
  }

  // ✅ ماب للتريلر
  static TrailerEntity toTrailerEntity(TrailerModel trailerModel) {
    return TrailerEntity(
      iso6391: trailerModel.iso6391,
      iso31661: trailerModel.iso31661,
      name: trailerModel.name,
      key: trailerModel.key,
      site: trailerModel.site,
      size: trailerModel.size,
      type: trailerModel.type,
      official: trailerModel.official,
      publishedAt: trailerModel.publishedAt,
      id: trailerModel.id,
    );
  }
}
