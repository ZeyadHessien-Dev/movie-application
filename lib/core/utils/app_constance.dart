class ApiConstance {
  static const String baseUrl = "https://api.themoviedb.org/3";
  static const String apiKey = "e99d3721c68ff556eafbeb2aeb873bb8";
  static const String baseImageUrl = "https://image.tmdb.org/t/p/w500";

  static String imageUrl(String path) => "$baseImageUrl$path";
  static const nowPlayingMoviesPath =
      "$baseUrl/movie/now_playing?api_key=$apiKey";
  static const popularMoviePath = "$baseUrl/movie/popular?api_key=$apiKey";
  static const topRatedMoviePath = "$baseUrl/movie/top_rated?api_key=$apiKey";

  static detailsMoviePath(movieId) => "$baseUrl/movie/$movieId?api_key=$apiKey";

  static recommendationPath(movieId) => "$baseUrl/movie/$movieId/recommendations?api_key=$apiKey";
}
