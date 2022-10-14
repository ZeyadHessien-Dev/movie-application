import 'package:clean_architecture_course_elgendy/core/usecase/base_usecase.dart';
import 'package:dartz/dartz.dart';
import '../../../core/error/failure.dart';
import '../entities/movie_entity.dart';
import '../repositories/base_movie_repositories.dart';

class GetTopRatedMoviesUseCase
    extends BaseUseCase<List<MovieEntity>, NoParameter> {
  final BaseMovieRepositories baseRepositories;

  GetTopRatedMoviesUseCase(this.baseRepositories);

  @override
  Future<Either<Failure, List<MovieEntity>>> call(NoParameter parameter) async {
    return await baseRepositories.getTopRated();
  }
}
