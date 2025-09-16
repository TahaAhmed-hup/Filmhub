import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/movie/usecases/get_trending_movies.dart';
import '../../../service_locator.dart';
import 'trendings_state.dart';

class TrendingsCubit extends Cubit<TrendingsState> {
  TrendingsCubit() : super(TrendingsMoviesLoading());

  void getTrendingMovies() async {
    var returnedData = await sl<GetTrendingMoviesUseCase>().call();
    returnedData.fold(
      (error) {
        emit(FailureLoadTrendingsMovies(errorMessage: error));
      },
      (data) {
        emit(TrendingsMoviesLoaded(movies: data));
      },
    );
  }
}
