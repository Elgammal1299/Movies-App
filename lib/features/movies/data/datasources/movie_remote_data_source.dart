import 'package:dio/dio.dart';
import 'package:movies_app/core/error/exceptions.dart';
import 'package:movies_app/core/network/api_constance.dart';
import 'package:movies_app/core/network/error_message_model.dart';
import 'package:movies_app/features/movies/data/models/favorite_request_model.dart';
import 'package:movies_app/features/movies/data/models/favorite_response_model.dart';
import 'package:movies_app/features/movies/data/models/movie_details_model.dart';
import 'package:movies_app/features/movies/data/models/movie_model.dart';
import 'package:movies_app/features/movies/data/models/recommendation_model.dart';
import 'package:movies_app/features/movies/domain/usecases/add_to_favorite_usecase.dart';
import 'package:movies_app/features/movies/domain/usecases/get_favorite_movies_usecase.dart';
import 'package:movies_app/features/movies/domain/usecases/get_movie_details_usecase.dart';
import 'package:movies_app/features/movies/domain/usecases/get_recommendation_usecase.dart';

abstract class BaseMovieRemoteDataSource {
  Future<List<MovieModel>> getNowPlayingMovies();

  Future<List<MovieModel>> getPopularMovies();

  Future<List<MovieModel>> getTopRatedMovies();

  Future<MovieDetailsModel> getMovieDetails(MovieDetailsParameters parameters);

  Future<List<RecommendationModel>> getRecommendation(
    RecommendationParameters parameters,
  );
  Future<FavoriteResponseModel> addToFavorite(
    AddToFavoriteParameters parameters,
  );
  Future<List<MovieModel>> getFavoriteMovies(
    FavoriteMoviesParameters parameters,
  );
}

class MovieRemoteDataSource extends BaseMovieRemoteDataSource {
  @override
  Future<List<MovieModel>> getNowPlayingMovies() async {
    final response = await Dio().get(ApiConstance.nowPlayingMoviesPath);
    if (response.statusCode == 200) {
      return List<MovieModel>.from(
        (response.data["results"] as List).map((e) => MovieModel.fromJson(e)),
      );
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    final response = await Dio().get(ApiConstance.popularMoviesPath);

    if (response.statusCode == 200) {
      return List<MovieModel>.from(
        (response.data["results"] as List).map((e) => MovieModel.fromJson(e)),
      );
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies() async {
    final response = await Dio().get(ApiConstance.topRatedMoviesPath);

    if (response.statusCode == 200) {
      return List<MovieModel>.from(
        (response.data["results"] as List).map((e) => MovieModel.fromJson(e)),
      );
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<MovieDetailsModel> getMovieDetails(
    MovieDetailsParameters parameters,
  ) async {
    final response = await Dio().get(
      ApiConstance.movieDetailsPath(parameters.movieId),
    );

    if (response.statusCode == 200) {
      return MovieDetailsModel.fromJson(response.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<RecommendationModel>> getRecommendation(
    RecommendationParameters parameters,
  ) async {
    final response = await Dio().get(
      ApiConstance.recommendationPath(parameters.id),
    );

    if (response.statusCode == 200) {
      return List<RecommendationModel>.from(
        (response.data["results"] as List).map(
          (e) => RecommendationModel.fromJson(e),
        ),
      );
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<FavoriteResponseModel> addToFavorite(
    AddToFavoriteParameters parameters,
  ) async {
    final requestModel = FavoriteRequestModel(
      mediaType: 'movie',
      mediaId: parameters.movieId,
      favorite: parameters.favorite,
    );

    final response = await Dio().post(
      ApiConstance.addToFavoritePath(),
      data: requestModel.toJson(),
      options: Options(
        headers: {
          'content-type': 'application/json',
          'Authorization': 'Bearer ${ApiConstance.accessToken}',
        },
      ),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      return FavoriteResponseModel.fromJson(response.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<MovieModel>> getFavoriteMovies(
    FavoriteMoviesParameters parameters,
  ) async {
    final response = await Dio().get(
      ApiConstance.favoriteMoviesPath(
        page: parameters.page,
        sortBy: parameters.sortBy,
      ),
      options: Options(
        headers: {'Authorization': 'Bearer ${ApiConstance.accessToken}'},
      ),
    );

    if (response.statusCode == 200) {
      return List<MovieModel>.from(
        (response.data["results"] as List).map((e) => MovieModel.fromJson(e)),
      );
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}
