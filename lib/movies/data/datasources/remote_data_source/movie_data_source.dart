import 'package:clean_architecture_course_elgendy/core/error/exceptions.dart';
import 'package:clean_architecture_course_elgendy/core/network/error_message_model.dart';
import 'package:clean_architecture_course_elgendy/core/utils/app_constance.dart';
import 'package:clean_architecture_course_elgendy/movies/data/model/movie_model.dart';
import 'package:clean_architecture_course_elgendy/movies/domain/usecases/get_movie_details_usecases.dart';
import 'package:clean_architecture_course_elgendy/movies/domain/usecases/get_recommendations_use_case.dart';
import 'package:dio/dio.dart';
import '../../model/movie_details_model.dart';
import '../../model/recommendations_model.dart';

abstract class BaseMovieRemoteDataSource {
  Future<List<MovieModel>> getNowPlayingMovie();

  Future<List<MovieModel>> getPopularMovie();

  Future<List<MovieModel>> getTopRatedMovie();

  Future<MovieDetailsModel> getDetailsMovie(MovieDetailsParameter parameter);

  Future<List<RecommendationsModel>> getRecommendation(
      RecommendationsParameter parameter);
}

class MovieRemoteDataSource extends BaseMovieRemoteDataSource {
  @override
  Future<List<MovieModel>> getNowPlayingMovie() async {
    final response = await Dio().get(
      ApiConstance.nowPlayingMoviesPath,
    );
    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data["results"] as List)
          .map((element) => MovieModel.fromJson(element)));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<MovieModel>> getPopularMovie() async {
    final response = await Dio().get(
      ApiConstance.popularMoviePath,
    );
    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data["results"] as List)
          .map((element) => MovieModel.fromJson(element)));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<MovieModel>> getTopRatedMovie() async {
    final response = await Dio().get(
      ApiConstance.topRatedMoviePath,
    );
    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data["results"] as List)
          .map((element) => MovieModel.fromJson(element)));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<MovieDetailsModel> getDetailsMovie(
    MovieDetailsParameter parameter,
  ) async {
    final response = await Dio().get(
      ApiConstance.detailsMoviePath(
        parameter.movieId,
      ),
    );
    if (response.statusCode == 200) {
      return MovieDetailsModel.fromJson(response.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(
          response.data,
        ),
      );
    }
  }

  @override
  Future<List<RecommendationsModel>> getRecommendation(
      RecommendationsParameter parameter) async {
    final response = await Dio().get(
      ApiConstance.recommendationPath(
        parameter.id,
      ),
    );
    if (response.statusCode == 200) {
      return List<RecommendationsModel>.from((response.data['results'] as List)
          .map((element) => RecommendationsModel.fromJson(element)));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(
          response.data,
        ),
      );
    }
  }
}
