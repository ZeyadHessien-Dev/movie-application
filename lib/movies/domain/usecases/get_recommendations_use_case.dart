import 'package:clean_architecture_course_elgendy/core/error/failure.dart';
import 'package:clean_architecture_course_elgendy/core/usecase/base_usecase.dart';
import 'package:clean_architecture_course_elgendy/movies/domain/entities/recommendations_entity.dart';
import 'package:clean_architecture_course_elgendy/movies/domain/repositories/base_movie_repositories.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class GetRecommendationsUseCase
    extends BaseUseCase<List<RecommendationsEntity>, RecommendationsParameter> {
  BaseMovieRepositories baseMovieRepositories;

  GetRecommendationsUseCase(
    this.baseMovieRepositories,
  );

  @override
  Future<Either<Failure, List<RecommendationsEntity>>> call(
      RecommendationsParameter parameter) async {
    return await baseMovieRepositories.getRecommendations(parameter);
  }
}

class RecommendationsParameter extends Equatable {
  final int id;

  const RecommendationsParameter(
    this.id,
  );

  @override
  List<Object?> get props => [id];
}
