import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../Data/network/failure.dart';

abstract class BaseUseCase<In, Out> {
  Future<Either<Failure, Out>> execute(In input);
}

class NoParameters extends Equatable {
  const NoParameters();
  @override
  List<Object?> get props => [];
}
