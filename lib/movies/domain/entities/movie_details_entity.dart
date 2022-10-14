import 'package:equatable/equatable.dart';
import 'genres.dart';

class MovieDetailsEntity extends Equatable {
  final int id;
  final String backdropPath;
  final String title;
  final String overView;
  final double voteAverage;
  final String releaseDate;
  final int runTime;
  final List<Genres> genders;

  const MovieDetailsEntity({
    required this.id,
    required this.backdropPath,
    required this.title,
    required this.overView,
    required this.voteAverage,
    required this.releaseDate,
    required this.runTime,
    required this.genders,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        backdropPath,
        title,
        overView,
        voteAverage,
        releaseDate,
        runTime,
        genders,
      ];
}
