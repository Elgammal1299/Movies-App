class ApiConstance {
  static const String baseUrl = "https://api.themoviedb.org/3";
  static const String apiKey = "51f7b7ed0b82bf4eb27ba089602165a9";
  // IMPORTANT: Provide your TMDB v4 access token below
  static const String accessToken =
      "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI1MWY3YjdlZDBiODJiZjRlYjI3YmEwODk2MDIxNjVhOSIsIm5iZiI6MTY5OTc3MTcwMC40MTgsInN1YiI6IjY1NTA3NTM0NjdiNjEzNDVkYmJlOTJjMCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.mg7BJlu9jvfROVzoQKrP1NWYEcEwvVpa5bjepXNlDAA";
  static const String accountId = "20698933";
  static const String nowPlayingMoviesPath =
      "$baseUrl/movie/now_playing?api_key=$apiKey";
  static const String popularMoviesPath =
      "$baseUrl/movie/popular?api_key=$apiKey";
  static const String topRatedMoviesPath =
      "$baseUrl/movie/top_rated?api_key=$apiKey";

  static String movieDetailsPath(int movieId) =>
      "$baseUrl/movie/$movieId?api_key=$apiKey";

  static String recommendationPath(int movieId) =>
      "$baseUrl/movie/$movieId/recommendations?api_key=$apiKey";

  static String favoriteMoviesPath({
    int page = 1,
    String sortBy = 'created_at.asc',
  }) =>
      "$baseUrl/account/$accountId/favorite/movies?language=en-US&page=$page&sort_by=$sortBy";

  static String addToFavoritePath() => "$baseUrl/account/$accountId/favorite";

  static const String baseImageUrl = 'https://image.tmdb.org/t/p/w500';

  static String imageUrl(String path) => '$baseImageUrl$path';
}
