import 'package:equatable/equatable.dart';

class RecommendationsEntity extends Equatable {
  final int id;
  final String? backdropPath;

  const RecommendationsEntity({
    required this.id,
    this.backdropPath,
  });

  @override
  List<Object?> get props => [
    id,
    backdropPath,
  ];


}
