import 'package:clean_architecture_course_elgendy/core/error/exceptions.dart';
import 'package:clean_architecture_course_elgendy/core/error/failure.dart';
import 'package:clean_architecture_course_elgendy/movies/domain/entities/movie_details_entity.dart';
import 'package:clean_architecture_course_elgendy/movies/domain/entities/movie_entity.dart';
import 'package:clean_architecture_course_elgendy/movies/domain/entities/recommendations_entity.dart';
import 'package:clean_architecture_course_elgendy/movies/domain/repositories/base_movie_repositories.dart';
import 'package:clean_architecture_course_elgendy/movies/domain/usecases/get_recommendations_use_case.dart';
import 'package:dartz/dartz.dart';
import '../datasources/remote_data_source/movie_data_source.dart';

class MovieRepository extends BaseMovieRepositories {
  final BaseMovieRemoteDataSource baseMovieRemoteDataSource;

  MovieRepository(this.baseMovieRemoteDataSource);

  @override
  Future<Either<Failure, List<MovieEntity>>> getNowPlaying() async {
    final result = await baseMovieRemoteDataSource.getNowPlayingMovie();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(
        ServerFailure(
          failure.errorMessageModel.statusMessage,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<MovieEntity>>> getPopular() async {
    final result = await baseMovieRemoteDataSource.getPopularMovie();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(
        ServerFailure(
          failure.errorMessageModel.statusMessage,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<MovieEntity>>> getTopRated() async {
    final result = await baseMovieRemoteDataSource.getTopRatedMovie();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(
        ServerFailure(
          failure.errorMessageModel.statusMessage,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, MovieDetailsEntity>> getMovieDetails(parameter) async {
    final result = await baseMovieRemoteDataSource.getDetailsMovie(parameter);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(
        ServerFailure(
          failure.errorMessageModel.statusMessage,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<RecommendationsEntity>>> getRecommendations(
      RecommendationsParameter parameter) async {
    final result = await baseMovieRemoteDataSource.getRecommendation(parameter);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(
        ServerFailure(
          failure.errorMessageModel.statusMessage,
        ),
      );
    }
  }
}
