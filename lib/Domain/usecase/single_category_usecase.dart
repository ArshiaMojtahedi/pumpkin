import 'package:appwrite/models.dart';
import 'package:dartz/dartz.dart';

import '../../Data/model/product.dart';
import '../../Data/network/failure.dart';
import '../../Data/request/request.dart';
import '../repository/repository.dart';
import 'base_usecase.dart';

class SingleCategoryUseCase
    implements BaseUseCase<SingleCategoryProducsUseCaseInput, List<Product>> {
  final Repository _repository;

  SingleCategoryUseCase(this._repository);

  @override
  Future<Either<Failure, List<Product>>> execute(
          SingleCategoryProducsUseCaseInput input) =>
      _repository.getSingleCategory(input.catId);
}

class SingleCategoryProducsUseCaseInput {
  String catId;

  SingleCategoryProducsUseCaseInput(this.catId);
}
