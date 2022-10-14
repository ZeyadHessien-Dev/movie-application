import 'package:clean_architecture_course_elgendy/core/error/failure.dart';
import 'package:clean_architecture_course_elgendy/core/usecase/base_usecase.dart';
import 'package:clean_architecture_course_elgendy/movies/domain/entities/movie_details_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../repositories/base_movie_repositories.dart';

class GetMovieDetailsUseCase
    extends BaseUseCase<MovieDetailsEntity, MovieDetailsParameter> {
  BaseMovieRepositories baseMovieRepositories;

  GetMovieDetailsUseCase(this.baseMovieRepositories);

  @override
  Future<Either<Failure, MovieDetailsEntity>> call(MovieDetailsParameter parameter) async {
    return await baseMovieRepositories.getMovieDetails(parameter);
  }


}

class MovieDetailsParameter extends Equatable {
  final int movieId;

  const MovieDetailsParameter(this.movieId);

  @override
  // TODO: implement props
  List<Object?> get props => [
        movieId,
      ];
}
