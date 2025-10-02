part of 'favorite_movies_bloc.dart';

class FavoriteMoviesState extends Equatable {
  final List<Movie> favoriteMovies;
  final RequestState favoriteMoviesState;
  final String favoriteMoviesMessage;
  final String addToFavoriteMessage;

  const FavoriteMoviesState({
    this.favoriteMovies = const [],
    this.favoriteMoviesState = RequestState.loading,
    this.favoriteMoviesMessage = '',
    this.addToFavoriteMessage = '',
  });

  FavoriteMoviesState copyWith({
    List<Movie>? favoriteMovies,
    RequestState? favoriteMoviesState,
    String? favoriteMoviesMessage,
    String? addToFavoriteMessage,
  }) {
    return FavoriteMoviesState(
      favoriteMovies: favoriteMovies ?? this.favoriteMovies,
      favoriteMoviesState: favoriteMoviesState ?? this.favoriteMoviesState,
      favoriteMoviesMessage: favoriteMoviesMessage ?? this.favoriteMoviesMessage,
      addToFavoriteMessage: addToFavoriteMessage ?? this.addToFavoriteMessage,
    );
  }

  @override
  List<Object?> get props => [
        favoriteMovies,
        favoriteMoviesState,
        favoriteMoviesMessage,
        addToFavoriteMessage,
      ];
}