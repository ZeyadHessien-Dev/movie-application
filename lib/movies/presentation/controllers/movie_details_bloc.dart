import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:clean_architecture_course_elgendy/core/utils/enums.dart';
import 'package:clean_architecture_course_elgendy/movies/domain/entities/movie_details_entity.dart';
import 'package:clean_architecture_course_elgendy/movies/domain/usecases/get_recommendations_use_case.dart';
import 'package:equatable/equatable.dart';
import '../../domain/entities/recommendations_entity.dart';
import '../../domain/usecases/get_movie_details_usecases.dart';
part 'movie_details_event.dart';
part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  GetMovieDetailsUseCase getMovieDetailsUseCase;
  GetRecommendationsUseCase getRecommendationsUseCase;

  MovieDetailsBloc(this.getMovieDetailsUseCase, this.getRecommendationsUseCase)
      : super(const MovieDetailsState()) {
    on<GetMovieDetailsEvent>(_getMovieDetails);
    on<GetMovieRecommendationEvent>(_getRecommendations);
  }

  FutureOr<void> _getMovieDetails(
      GetMovieDetailsEvent event, Emitter<MovieDetailsState> emit) async {
    final result = await getMovieDetailsUseCase(
      MovieDetailsParameter(
        event.id,
      ),
    );
    result.fold(
      (l) => emit(
        state.copyWith(
          detailsMovieStates: RequestState.error,
          detailsMovieMessage: l.message,
        ),
      ),
      (r) => emit(
        state.copyWith(
          detailsMovieStates: RequestState.loaded,
          detailsMovie: r,
        ),
      ),
    );
  }

  FutureOr<void> _getRecommendations(GetMovieRecommendationEvent event,
      Emitter<MovieDetailsState> emit) async {
    final result = await getRecommendationsUseCase(
      RecommendationsParameter(
        event.id,
      ),
    );
    result.fold(
      (l) => emit(
        state.copyWith(
          recommendationsMessage: l.message,
          recommendationsState: RequestState.error,
        ),
      ),
      (r) => emit(
        state.copyWith(
          recommendationsMovie: r,
          recommendationsState: RequestState.loaded,
        ),
      ),
    );
  }
}
