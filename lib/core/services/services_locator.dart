import 'package:clean_architecture_course_elgendy/movies/data/datasources/remote_data_source/movie_data_source.dart';
import 'package:clean_architecture_course_elgendy/movies/data/repostories/movie_repository.dart';
import 'package:clean_architecture_course_elgendy/movies/domain/repositories/base_movie_repositories.dart';
import 'package:clean_architecture_course_elgendy/movies/domain/usecases/get_movie_details_usecases.dart';
import 'package:clean_architecture_course_elgendy/movies/domain/usecases/get_popular_movie_usecases.dart';
import 'package:clean_architecture_course_elgendy/movies/domain/usecases/get_rated_movie_usecases.dart';
import 'package:clean_architecture_course_elgendy/movies/domain/usecases/get_recommendations_use_case.dart';
import 'package:clean_architecture_course_elgendy/movies/presentation/controllers/movie_bloc.dart';
import 'package:clean_architecture_course_elgendy/movies/presentation/controllers/movie_details_bloc.dart';
import 'package:get_it/get_it.dart';
import '../../movies/domain/usecases/get_now_playing_movie_usecases.dart';

final servicesLocator = GetIt.instance;

class ServicesLocator {
  void init() {
    /// BLOC
    servicesLocator.registerFactory(() => MovieDetailsBloc(
      servicesLocator(),
      servicesLocator(),
    ));
    
    servicesLocator.registerFactory(() => MovieBloc(
          servicesLocator(),
          servicesLocator(),
          servicesLocator(),
        ));

    /// UseCases
    servicesLocator.registerLazySingleton(
      () => GetNowPlayingMoviesUseCase(
        servicesLocator(),
      ),
    );

    servicesLocator.registerLazySingleton(
      () => GetPopularMoviesUseCase(
        servicesLocator(),
      ),
    );

    servicesLocator.registerLazySingleton(
      () => GetTopRatedMoviesUseCase(
        servicesLocator(),
      ),
    );

    servicesLocator.registerLazySingleton(
          () => GetMovieDetailsUseCase(
        servicesLocator(),
      ),
    );
    servicesLocator.registerLazySingleton(
          () => GetRecommendationsUseCase(
        servicesLocator(),
      ),
    );

    /// Repository
    servicesLocator.registerLazySingleton<BaseMovieRepositories>(
        () => MovieRepository(servicesLocator()));

    /// Data Sources
    servicesLocator.registerLazySingleton<BaseMovieRemoteDataSource>(
        () => MovieRemoteDataSource());
  }
}
