import 'package:clean_architecture_course_elgendy/core/usecase/base_usecase.dart';
import 'package:clean_architecture_course_elgendy/movies/domain/entities/movie_entity.dart';
import 'package:clean_architecture_course_elgendy/movies/domain/repositories/base_movie_repositories.dart';
import 'package:dartz/dartz.dart';
import '../../../core/error/failure.dart';

class GetNowPlayingMoviesUseCase
    extends BaseUseCase<List<MovieEntity>, NoParameter> {
  final BaseMovieRepositories baseRepositories;

  GetNowPlayingMoviesUseCase(this.baseRepositories);

  @override
  Future<Either<Failure, List<MovieEntity>>> call(NoParameter parameter) async {
    return await baseRepositories.getNowPlaying();
  }
}
