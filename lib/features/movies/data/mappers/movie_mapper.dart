import 'package:movies_app/features/movies/data/models/movie_model.dart';
import 'package:movies_app/features/movies/domain/entities/movie.dart';

class MovieMapper {
  static Movie toEntity(MovieModel model) {
    return Movie(
      id: model.id,
      title: model.title,
      backdropPath: model.backdropPath,
      genreIds: model.genreIds,
      overview: model.overview,
      voteAverage: model.voteAverage,
      releaseDate: model.releaseDate,
    );
  }

  static List<Movie> toEntityList(List<MovieModel> models) {
    return models.map((model) => toEntity(model)).toList();
  }
}
