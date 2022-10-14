import 'package:clean_architecture_course_elgendy/movies/domain/entities/movie_entity.dart';

class MovieModel extends MovieEntity {
  const MovieModel({
    required super.id,
    required super.title,
    required super.backdropPath,
    required super.overView,
    required super.genreIds,
    required super.voteAverage,
    required super.releaseDate,
  });
  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      id: json["id"],
      title: json["title"],
      backdropPath: json["backdrop_path"],
      overView: json["overview"],
      genreIds: List<int>.from((json["genre_ids"] as List).map((e) => e)),
      voteAverage: json["vote_average"].toDouble(),
      releaseDate: json["release_date"],
    );
  }
}
