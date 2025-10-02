import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/features/movies/domain/entities/movie.dart';
import 'package:movies_app/features/movies/domain/entities/movie_detail.dart';
import 'package:movies_app/features/movies/domain/entities/recommendation.dart';
import 'package:movies_app/features/movies/domain/usecases/add_to_favorite_usecase.dart';
import 'package:movies_app/features/movies/domain/usecases/get_favorite_movies_usecase.dart';
import 'package:movies_app/features/movies/domain/usecases/get_movie_details_usecase.dart';
import 'package:movies_app/features/movies/domain/usecases/get_recommendation_usecase.dart';

abstract class BaseMoviesRepository {
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies();

  Future<Either<Failure, List<Movie>>> getPopularMovies();

  Future<Either<Failure, List<Movie>>> getTopRatedMovies();

  Future<Either<Failure, MovieDetail>> getMovieDetails(
    MovieDetailsParameters parameters,
  );

  Future<Either<Failure, List<Recommendation>>> getRecommendation(
    RecommendationParameters parameters,
  );

  // Favorite Movies Methods
  Future<Either<Failure, bool>> addToFavorite(
    AddToFavoriteParameters parameters,
  );
  Future<Either<Failure, List<Movie>>> getFavoriteMovies(
    FavoriteMoviesParameters parameters,
  );
}
