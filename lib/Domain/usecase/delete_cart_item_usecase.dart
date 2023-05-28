import 'package:appwrite/models.dart';
import 'package:dartz/dartz.dart';
import 'package:pumpkin/Data/model/cartItem.dart';

import '../../Data/model/product.dart';
import '../../Data/network/failure.dart';
import '../../Data/request/request.dart';
import '../repository/repository.dart';
import 'base_usecase.dart';

class DeleteCartItemUseCase implements BaseUseCase<DeleteCartItemInput, void> {
  final Repository _repository;

  DeleteCartItemUseCase(this._repository);

  @override
  Future<Either<Failure, void>> execute(DeleteCartItemInput input) =>
      _repository.deleteCartItem(input.id);
}

class DeleteCartItemInput {
  String id;
  DeleteCartItemInput(this.id);
}
