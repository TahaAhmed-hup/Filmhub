import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/domain/movie/usecases/search_movie.dart';
import 'package:netflix/presentation/search/bloc/search_state.dart';
import 'package:netflix/presentation/search/bloc/selectable_option_cubit.dart';

import '../../../domain/tv/usecases/search_tv.dart';
import '../../../service_locator.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());

  TextEditingController textEditingController = TextEditingController();

  void search(String query, SearchType searchType) {
    if (query.isNotEmpty) {
      emit(SearchLoading());

      switch (searchType) {
        // ✅ تعديل هنا
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
          .timeout(const Duration(seconds: 10)); // ✅ timeout

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
    // ✅ Future<void>
    try {
      var returnedData = await sl<SearchTvUseCase>()
          .call(params: query)
          .timeout(const Duration(seconds: 10)); // ✅ timeout

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
