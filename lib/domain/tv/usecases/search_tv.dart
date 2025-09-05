import 'package:dartz/dartz.dart';
import 'package:netflix/domain/tv/repositories/tv.dart';

import '../../../core/usecase/usecase.dart';
import '../../../service_locator.dart';

class SearchTvUseCase extends UseCase<Either, String> {
  @override
  Future<Either> call({String? params}) async {
    return await sl<TvRepository>().searchTV(params!);
  }
}
