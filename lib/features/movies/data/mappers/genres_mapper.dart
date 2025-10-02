import 'package:movies_app/features/movies/data/models/genres_model.dart';
import 'package:movies_app/features/movies/domain/entities/genres.dart';

class GenresMapper {
  static Genres toEntity(GenresModel model) {
    return Genres(name: model.name, id: model.id);
  }

  static List<Genres> toEntityList(List<GenresModel> models) {
    return models.map((model) => toEntity(model)).toList();
  }
}
