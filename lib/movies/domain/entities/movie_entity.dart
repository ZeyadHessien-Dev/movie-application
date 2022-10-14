
import 'package:equatable/equatable.dart';

class MovieEntity extends Equatable {
  final int id;
  final String title;
  final String backdropPath;
  final String overView;
  final List<int> genreIds;
  final double voteAverage;
  final String releaseDate;

  const MovieEntity({
    required this.id,
    required this.title,
    required this.backdropPath,
    required this.overView,
    required this.genreIds,
    required this.voteAverage,
    required this.releaseDate,
  });

  /// With Package
  @override
  List<Object> get props => [
        id,
        title,
        backdropPath,
        overView,
        genreIds,
        voteAverage,
        releaseDate,
      ];
}
