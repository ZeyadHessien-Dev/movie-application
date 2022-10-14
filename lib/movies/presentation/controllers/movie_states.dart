import 'package:equatable/equatable.dart';
import '../../../core/utils/enums.dart';
import '../../domain/entities/movie_entity.dart';

class MoviesStates extends Equatable {
  /// Now Playing
  final List<MovieEntity> nowPlayingMovies;
  final RequestState nowPlayingState;
  final String nowPlayingMessage;

  /// Popular
  final List<MovieEntity> popularMovies;
  final RequestState popularState;
  final String popularMessage;

  /// Top Rated
  final List<MovieEntity> topRatedMovies;
  final RequestState topRatedState;
  final String topRatedMessage;

  const MoviesStates({
    /// Now Playing
    this.nowPlayingMovies = const [],
    this.nowPlayingState = RequestState.loading,
    this.nowPlayingMessage = '',

    /// Popular
    this.popularMovies = const [],
    this.popularState = RequestState.loading,
    this.popularMessage = '',

    /// Top Rated
    this.topRatedMovies = const [],
    this.topRatedState = RequestState.loading,
    this.topRatedMessage = '',
  });

  MoviesStates copyWith({
    /// Now Playing
    List<MovieEntity>? nowPlayingMovies,
    RequestState? nowPlayingState,
    String? nowPlayingMessage,

    /// Popular
    List<MovieEntity>? popularMovies,
    RequestState? popularState,
    String? popularMessage,

    /// Top Rated
    List<MovieEntity>? topRatedMovies,
    RequestState? topRatedState,
    String? topRatedMessage,
  }) {
    return MoviesStates(
      /// Now Playing
      nowPlayingMovies: nowPlayingMovies ?? this.nowPlayingMovies,
      nowPlayingState: nowPlayingState ?? this.nowPlayingState,
      nowPlayingMessage: nowPlayingMessage ?? this.nowPlayingMessage,

      /// Popular
      popularMovies: popularMovies ?? this.popularMovies,
      popularState: popularState ?? this.popularState,
      popularMessage: popularMessage ?? this.popularMessage,

      /// Top Rated
      topRatedMovies: topRatedMovies ?? this.topRatedMovies,
      topRatedState: topRatedState ?? this.topRatedState,
      topRatedMessage: topRatedMessage ?? this.topRatedMessage,
    );
  }

  @override
  List<Object?> get props => [
        /// Now Playing
        nowPlayingMovies,
        nowPlayingState,
        nowPlayingMessage,

        /// Popular
        popularMovies,
        popularState,
        popularMessage,

        /// Top Rated
        topRatedMovies,
        topRatedState,
        topRatedMessage,
      ];
}
