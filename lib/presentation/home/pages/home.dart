import 'package:film_hub/commen/helpers/navigation/app_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../commen/widgets/appbar/app_bar.dart';
import '../../../core/configs/assets/app_vectors.dart';
import '../../search/pages/search.dart';
import '../widgets/category_text.dart';
import '../widgets/now_playing_movies.dart';
import '../widgets/popular_tv.dart';
import '../widgets/trending_movies.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(
        hideBack: true,
        action: IconButton(
          onPressed: () {
            AppNavigator.push(context, const SearchPage());
          },
          icon: const Icon(Icons.search),
        ),
        title: SvgPicture.asset(AppVectors.logo),
      ),
      body: const SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🔥 Trending movies
            CategoryText(title: 'Trending 🔥'),
            TrendingsMovies(),
            SizedBox(height: 16),

            // 🎬 Now Playing movies (Horizontal list)
            CategoryText(title: 'Now Playing 🎬'),
            SizedBox(height: 16),
            NowPlayingMovies(),
            SizedBox(height: 16),

            // 📺 Popular TV shows (Horizontal list)
            CategoryText(title: 'Popular TV 📺'),
            SizedBox(height: 16),
            PopularTv(),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
