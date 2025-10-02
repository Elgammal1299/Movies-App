import 'package:movies_app/features/movies/data/models/movie_details_model.dart';
import 'package:movies_app/features/movies/domain/entities/movie_detail.dart';
import 'package:movies_app/features/movies/data/mappers/genres_mapper.dart';

class MovieDetailsMapper {
  static MovieDetail toEntity(MovieDetailsModel model) {
    return MovieDetail(
      backdropPath: model.backdropPath,
      genres: GenresMapper.toEntityList(model.genres),
      id: model.id,
      overview: model.overview,
      releaseDate: model.releaseDate,
      runtime: model.runtime,
      title: model.title,
      voteAverage: model.voteAverage,
    );
  }
}
