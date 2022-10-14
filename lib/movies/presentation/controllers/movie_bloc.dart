import 'dart:async';
import 'package:clean_architecture_course_elgendy/core/usecase/base_usecase.dart';
import 'package:clean_architecture_course_elgendy/core/utils/enums.dart';
import 'package:clean_architecture_course_elgendy/movies/domain/usecases/get_now_playing_movie_usecases.dart';
import 'package:clean_architecture_course_elgendy/movies/domain/usecases/get_popular_movie_usecases.dart';
import 'package:clean_architecture_course_elgendy/movies/domain/usecases/get_rated_movie_usecases.dart';
import 'package:clean_architecture_course_elgendy/movies/presentation/controllers/movie_event.dart';
import 'package:clean_architecture_course_elgendy/movies/presentation/controllers/movie_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovieBloc extends Bloc<MoviesEvent, MoviesStates> {
  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;
  final GetPopularMoviesUseCase getPopularMoviesUseCase;
  final GetTopRatedMoviesUseCase getTopRatedMoviesUseCase;

  MovieBloc(
    this.getNowPlayingMoviesUseCase,
    this.getPopularMoviesUseCase,
    this.getTopRatedMoviesUseCase,
  ) : super(const MoviesStates()) {
    on<GetNowPlayingEvent>(_getNowPlayingMovies);

    on<GetPopularEvent>(_getPopularMovies);

    on<GetTopRatedEvent>(_getTopRatedMovies);
  }

  FutureOr<void> _getNowPlayingMovies(event, emit) async {
    final result = await getNowPlayingMoviesUseCase(const NoParameter());

    result.fold(
      (l) => emit(
        state.copyWith(
          nowPlayingMessage: l.message,
          nowPlayingState: RequestState.error,
        ),
      ),
      (r) => emit(
        state.copyWith(
          nowPlayingMovies: r,
          nowPlayingState: RequestState.loaded,
        ),
      ),
    );
  }

  FutureOr<void> _getPopularMovies(event, emit) async {
    final result = await getPopularMoviesUseCase(const NoParameter());
    result.fold(
      (l) => emit(
        state.copyWith(
          popularState: RequestState.error,
          popularMessage: l.message,
        ),
      ),
      (r) => emit(
        state.copyWith(
          popularState: RequestState.loaded,
          popularMovies: r,
        ),
      ),
    );
  }

  FutureOr<void> _getTopRatedMovies(event, emit) async {
    final result = await getTopRatedMoviesUseCase(const NoParameter());
    result.fold(
      (l) => emit(
        state.copyWith(
          topRatedState: RequestState.error,
          topRatedMessage: l.message,
        ),
      ),
      (r) => emit(
        state.copyWith(
          topRatedState: RequestState.loaded,
          topRatedMovies: r,
        ),
      ),
    );
  }
}
