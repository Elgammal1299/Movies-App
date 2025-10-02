import 'package:movies_app/features/movies/data/models/recommendation_model.dart';
import 'package:movies_app/features/movies/domain/entities/recommendation.dart';

class RecommendationMapper {
  static Recommendation toEntity(RecommendationModel model) {
    return Recommendation(backdropPath: model.backdropPath, id: model.id);
  }

  static List<Recommendation> toEntityList(List<RecommendationModel> models) {
    return models.map((model) => toEntity(model)).toList();
  }
}
