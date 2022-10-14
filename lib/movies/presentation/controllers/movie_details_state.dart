part of 'movie_details_bloc.dart';

class MovieDetailsState extends Equatable {
  /// Details Movie
  final MovieDetailsEntity? detailsMovie;
  final RequestState detailsMovieStates;
  final String detailsMovieMessage;

  /// Recommendations
  final List<RecommendationsEntity> recommendationsMovie;
  final RequestState recommendationsState;
  final String recommendationsMessage;

  const MovieDetailsState({
    /// Details Movie
    this.detailsMovie,
    this.detailsMovieStates = RequestState.loading,
    this.detailsMovieMessage = '',

    /// Recommendations
    this.recommendationsMovie  = const [],
    this.recommendationsState = RequestState.loading,
    this.recommendationsMessage = '',
  });

  MovieDetailsState copyWith({
    /// Details Movie
    MovieDetailsEntity? detailsMovie,
    RequestState? detailsMovieStates,
    String? detailsMovieMessage,

    /// Recommendations
    List<RecommendationsEntity>? recommendationsMovie,
    RequestState? recommendationsState,
    String? recommendationsMessage,
  }) {
    return MovieDetailsState(
      /// Details Movie
      detailsMovie: detailsMovie ?? this.detailsMovie,
      detailsMovieStates: detailsMovieStates ?? this.detailsMovieStates,
      detailsMovieMessage: detailsMovieMessage ?? this.detailsMovieMessage,

      /// Recommendations
      recommendationsMovie: recommendationsMovie ?? this.recommendationsMovie,
      recommendationsState: recommendationsState ?? this.recommendationsState,
      recommendationsMessage:
          recommendationsMessage ?? this.recommendationsMessage,
    );
  }

  @override
  List<Object?> get props => [
        /// Details Movie
        detailsMovie,
        detailsMovieStates,
        detailsMovieMessage,

        /// Recommendations
        recommendationsMovie,
        recommendationsState,
        recommendationsMessage,
      ];
}
