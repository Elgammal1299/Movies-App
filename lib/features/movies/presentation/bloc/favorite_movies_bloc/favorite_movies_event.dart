part of 'favorite_movies_bloc.dart';

abstract class FavoriteMoviesEvent extends Equatable {
  const FavoriteMoviesEvent();

  @override
  List<Object> get props => [];
}

class GetFavoriteMoviesEvent extends FavoriteMoviesEvent {
  final int page;
  final String sortBy;

  const GetFavoriteMoviesEvent({
    this.page = 1,
    this.sortBy = 'created_at.asc',
  });

  @override
  List<Object> get props => [page, sortBy];
}

class AddToFavoriteEvent extends FavoriteMoviesEvent {
  final int movieId;

  const AddToFavoriteEvent(this.movieId);

  @override
  List<Object> get props => [movieId];
}

class RemoveFromFavoriteEvent extends FavoriteMoviesEvent {
  final int movieId;

  const RemoveFromFavoriteEvent(this.movieId);

  @override
  List<Object> get props => [movieId];
}