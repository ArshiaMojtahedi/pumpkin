import 'package:appwrite/models.dart';
import 'package:dartz/dartz.dart';

import '../../Data/network/failure.dart';
import '../../Data/request/request.dart';
import '../repository/repository.dart';
import 'base_usecase.dart';

class GetItemCountUseCase implements BaseUseCase<GetItemCountInput, int> {
  final Repository _repository;

  GetItemCountUseCase(this._repository);

  @override
  Future<Either<Failure, int>> execute(GetItemCountInput input) =>
      _repository.getItemCount(input.id);
}

class GetItemCountInput {
  String id;

  GetItemCountInput(this.id);
}
