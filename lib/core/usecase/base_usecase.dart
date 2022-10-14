import 'package:clean_architecture_course_elgendy/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

abstract class BaseUseCase<T, Parameter> {
  Future<Either<Failure, T>> call(Parameter parameter);
}


class NoParameter extends Equatable {
  const NoParameter();

  @override
  List<Object?> get props => [];
}
