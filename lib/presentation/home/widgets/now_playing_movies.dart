import 'package:film_hub/commen/bloc/generic_data_cubit.dart';
import 'package:film_hub/commen/bloc/generic_data_state.dart';
import 'package:film_hub/domain/movie/entities/movie.dart';
import 'package:film_hub/domain/movie/usecases/get_now_playing_movies.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../commen/widgets/movie/movie_card.dart';
import '../../../service_locator.dart';

class NowPlayingMovies extends StatelessWidget {
  const NowPlayingMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GenericDataCubit()
        ..getData<List<MovieEntity>>(sl<GetNowPlayingMoviesUseCase>()),
      child: BlocBuilder<GenericDataCubit, GenericDataState>(
        builder: (context, state) {
          if (state is DataLoading) {
            return const SizedBox(
              height: 300,
              child: Center(child: CircularProgressIndicator()),
            );
          }

          if (state is DataLoaded<List<MovieEntity>>) {
            if (state.data.isEmpty) {
              return const SizedBox(
                height: 300,
                child: Center(child: Text("No now playing movies found")),
              );
            }

            return SizedBox(
              height: 300,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemBuilder: (context, index) {
                  return MovieCard(movieEntity: state.data[index]);
                },
                separatorBuilder: (context, index) => const SizedBox(width: 10),
                itemCount: state.data.length,
              ),
            );
          }

          if (state is FailureLoadData) {
            return SizedBox(
              height: 300,
              child: Center(child: Text(state.errorMessage)),
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
