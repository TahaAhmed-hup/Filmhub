import 'package:fan_carousel_image_slider/fan_carousel_image_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/configs/assets/app_images.dart';
import '../bloc/trendings_cubit.dart';
import '../bloc/trendings_state.dart';

class TrendingsMovies extends StatelessWidget {
  const TrendingsMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TrendingsCubit()..getTrendingMovies(),
      child: BlocBuilder<TrendingsCubit, TrendingsState>(
        builder: (context, state) {
          if (state is TrendingsMoviesLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is TrendingsMoviesLoaded) {
            if (state.movies.isEmpty) {
              return const Center(
                child: Text("No trending movies found"),
              );
            }

            return FanCarouselImageSlider.sliderType1(
              imagesLink: state.movies
                  .map(
                    (item) => item.posterPath != null
                        ? AppImages.MovieImageBasePath + item.posterPath!
                        : AppImages.defaultImage,
                  )
                  .toList(),
              isAssets: false,
              autoPlay: false,
              sliderHeight: 400,
              showIndicator: true,
            );
          }

          if (state is FailureLoadTrendingsMovies) {
            return Center(
              child: Text(state.errorMessage),
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
