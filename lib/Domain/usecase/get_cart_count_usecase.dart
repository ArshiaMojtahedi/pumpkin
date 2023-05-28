import 'package:appwrite/models.dart';
import 'package:dartz/dartz.dart';
import 'package:pumpkin/Data/model/product.dart';

import '../../Data/network/failure.dart';
import '../../Data/request/request.dart';
import '../repository/repository.dart';
import 'base_usecase.dart';

class GetCartCountUseCase implements BaseUseCase<NoParameters, int> {
  final Repository _repository;

  GetCartCountUseCase(this._repository);

  @override
  Future<Either<Failure, int>> execute(NoParameters p) =>
      _repository.getCartCount();
}
