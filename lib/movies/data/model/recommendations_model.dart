import 'package:clean_architecture_course_elgendy/movies/domain/entities/recommendations_entity.dart';

class RecommendationsModel extends RecommendationsEntity {
  const RecommendationsModel({
    required super.id,
    super.backdropPath,
  });

  factory RecommendationsModel.fromJson(Map<String, dynamic> json) =>
      RecommendationsModel(
        id: json['id'],
        backdropPath: json['backdrop_path'] ?? "/2Ezf9QUH4Ne2SSb1tfU3sjrTplZ.jpg",
      );
}
