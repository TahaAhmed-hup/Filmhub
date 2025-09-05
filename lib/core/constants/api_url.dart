class ApiUrl {
  static const String baseURL = 'http://192.168.1.5:5000/';
  static const apiv = 'api/v1/';
  static const String signup = '${apiv}auth/signup';
  static const String signin = '${apiv}auth/signin';

  static const trendingMovies = '${apiv}movie/trending';
  static const nowPlayingMovies =
      '${apiv}movie/now_playing'; // صححت من /nowplaying لـ /now_playing
  static const popularTv = '${apiv}tv/popular';
  static const movie = '${apiv}movie/';
  static const tv = '${apiv}tv/';
  static const search = '${apiv}search/';

  static const trailerBaseUrl = 'https://www.youtube.com/watch?v=';
}
