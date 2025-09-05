import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/movie/usecases/search_movie.dart';
import '../../../domain/tv/usecases/search_tv.dart';
import '../../../service_locator.dart';
import 'search_state.dart';
import 'selectable_option_cubit.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());

  TextEditingController textEditingController = TextEditingController();

  void search(String query, SearchType searchType) {
    if (query.isNotEmpty) {
      emit(SearchLoading());

      switch (searchType) {
        case SearchType.movie:
          searchMovie(query);
          break;
        case SearchType.tv:
          searchTV(query);
          break;
      }
    }
  }

  Future<void> searchMovie(String query) async {
    try {
      var returnedData = await sl<SearchMovieUseCase>()
          .call(params: query)
          .timeout(const Duration(seconds: 10));

      returnedData.fold((errorMessage) {
        emit(SearchFailure(errorMessage: errorMessage));
      }, (data) {
        emit(MoviesLoaded(movies: data));
      });
    } catch (e) {
      emit(SearchFailure(errorMessage: e.toString()));
    }
  }

  Future<void> searchTV(String query) async {
    try {
      var returnedData = await sl<SearchTvUseCase>()
          .call(params: query)
          .timeout(const Duration(seconds: 10));

      returnedData.fold((errorMessage) {
        emit(SearchFailure(errorMessage: errorMessage));
      }, (data) {
        emit(TVLoaded(tvs: data));
      });
    } catch (e) {
      emit(SearchFailure(errorMessage: e.toString()));
    }
  }
}
