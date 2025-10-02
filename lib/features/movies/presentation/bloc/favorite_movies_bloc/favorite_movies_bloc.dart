import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/features/movies/domain/entities/movie.dart';
import 'package:movies_app/features/movies/domain/usecases/add_to_favorite_usecase.dart';
import 'package:movies_app/features/movies/domain/usecases/get_favorite_movies_usecase.dart';

part 'favorite_movies_event.dart';
part 'favorite_movies_state.dart';

class FavoriteMoviesBloc extends Bloc<FavoriteMoviesEvent, FavoriteMoviesState> {
  final AddToFavoriteUseCase addToFavoriteUseCase;
  final GetFavoriteMoviesUseCase getFavoriteMoviesUseCase;

  FavoriteMoviesBloc(this.addToFavoriteUseCase, this.getFavoriteMoviesUseCase)
      : super(const FavoriteMoviesState()) {
    on<GetFavoriteMoviesEvent>(_getFavoriteMovies);
    on<AddToFavoriteEvent>(_addToFavorite);
    on<RemoveFromFavoriteEvent>(_removeFromFavorite);
  }

  FutureOr<void> _getFavoriteMovies(
    GetFavoriteMoviesEvent event,
    Emitter<FavoriteMoviesState> emit,
  ) async {
    emit(state.copyWith(favoriteMoviesState: RequestState.loading));

    final result = await getFavoriteMoviesUseCase(
      FavoriteMoviesParameters(
        page: event.page,
        sortBy: event.sortBy,
      ),
    );

    result.fold(
      (l) => emit(state.copyWith(
        favoriteMoviesState: RequestState.error,
        favoriteMoviesMessage: l.message,
      )),
      (r) => emit(state.copyWith(
        favoriteMovies: r,
        favoriteMoviesState: RequestState.loaded,
      )),
    );
  }

  FutureOr<void> _addToFavorite(
    AddToFavoriteEvent event,
    Emitter<FavoriteMoviesState> emit,
  ) async {
    final result = await addToFavoriteUseCase(
      AddToFavoriteParameters(
        movieId: event.movieId,
        favorite: true,
      ),
    );

    result.fold(
      (l) => emit(state.copyWith(
        addToFavoriteMessage: l.message,
      )),
      (r) {
        if (r) {
          // Refresh favorite movies list
          add(GetFavoriteMoviesEvent());
        }
      },
    );
  }

  FutureOr<void> _removeFromFavorite(
    RemoveFromFavoriteEvent event,
    Emitter<FavoriteMoviesState> emit,
  ) async {
    final result = await addToFavoriteUseCase(
      AddToFavoriteParameters(
        movieId: event.movieId,
        favorite: false,
      ),
    );

    result.fold(
      (l) => emit(state.copyWith(
        addToFavoriteMessage: l.message,
      )),
      (r) {
        if (r) {
          // Refresh favorite movies list
          add(GetFavoriteMoviesEvent());
        }
      },
    );
  }
}