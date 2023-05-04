import 'package:appwrite/models.dart';
import 'package:dartz/dartz.dart';
import 'package:pumpkin/Data/model/product.dart';

import '../../Data/network/failure.dart';
import '../../Data/request/request.dart';
import '../repository/repository.dart';
import 'base_usecase.dart';

class ProductsUseCase
    implements BaseUseCase<ProductsUseCaseInput, List<Product>> {
  final Repository _repository;

  ProductsUseCase(this._repository);

  @override
  Future<Either<Failure, List<Product>>> execute(ProductsUseCaseInput input) =>
      _repository.getAllProducts();
}

class ProductsUseCaseInput {
  ProductsUseCaseInput();
}
