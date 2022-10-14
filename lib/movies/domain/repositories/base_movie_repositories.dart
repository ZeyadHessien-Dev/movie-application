import 'package:clean_architecture_course_elgendy/movies/domain/entities/recommendations_entity.dart';
import 'package:dartz/dartz.dart';
import '../../../core/error/failure.dart';
import '../entities/movie_details_entity.dart';
import '../entities/movie_entity.dart';
import '../usecases/get_movie_details_usecases.dart';
import '../usecases/get_recommendations_use_case.dart';

abstract class BaseMovieRepositories {
  Future<Either<Failure, List<MovieEntity>>> getNowPlaying();

  Future<Either<Failure, List<MovieEntity>>> getPopular();

  Future<Either<Failure, List<MovieEntity>>> getTopRated();

  Future<Either<Failure, MovieDetailsEntity>> getMovieDetails(MovieDetailsParameter parameter);

  Future<Either<Failure, List<RecommendationsEntity>>> getRecommendations(RecommendationsParameter parameter);

}
