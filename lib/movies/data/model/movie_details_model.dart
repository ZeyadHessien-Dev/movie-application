import 'package:clean_architecture_course_elgendy/movies/domain/entities/movie_details_entity.dart';

import 'geners_model.dart';

class MovieDetailsModel extends MovieDetailsEntity {
  const MovieDetailsModel({
    required super.id,
    required super.backdropPath,
    required super.title,
    required super.overView,
    required super.voteAverage,
    required super.releaseDate,
    required super.runTime,
    required super.genders,
  });

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) {
    return MovieDetailsModel(
      id: json['id'],
      backdropPath: json['backdrop_path'],
      title: json['title'],
      overView: json['overview'],
      releaseDate: json['release_date'],
      runTime: json['runtime'],
      voteAverage: json['vote_average'].toDouble(),
      genders: List<GenresModel>.from(
        (json['genres'] as List).map(
          (element) => GenresModel.fromJson(element),
        ),
      ),
    );
  }
}
