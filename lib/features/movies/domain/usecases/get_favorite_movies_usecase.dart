import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/core/usecase/base_usecase.dart';
import 'package:movies_app/features/movies/domain/entities/movie.dart';
import 'package:movies_app/features/movies/domain/repositories/base_movies_repository.dart';

class GetFavoriteMoviesUseCase
    extends BaseUseCase<List<Movie>, FavoriteMoviesParameters> {
  final BaseMoviesRepository baseMoviesRepository;

  GetFavoriteMoviesUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, List<Movie>>> call(
      FavoriteMoviesParameters parameters) async {
    return await baseMoviesRepository.getFavoriteMovies(parameters);
  }
}

class FavoriteMoviesParameters extends Equatable {
  final int page;
  final String sortBy;

  const FavoriteMoviesParameters({
    this.page = 1,
    this.sortBy = 'created_at.asc',
  });

  @override
  List<Object> get props => [page, sortBy];
}