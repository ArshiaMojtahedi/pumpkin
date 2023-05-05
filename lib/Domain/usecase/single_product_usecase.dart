import 'package:dartz/dartz.dart';

import '../../Data/model/product.dart';
import '../../Data/network/failure.dart';
import '../repository/repository.dart';
import 'base_usecase.dart';

class SingleProductUseCase
    implements BaseUseCase<SingleProductUseCaseInput, Product> {
  final Repository _repository;

  SingleProductUseCase(this._repository);

  @override
  Future<Either<Failure, Product>> execute(SingleProductUseCaseInput input) =>
      _repository.getSingleProduct(input.productId);
}

class SingleProductUseCaseInput {
  String productId;

  SingleProductUseCaseInput(this.productId);
}
