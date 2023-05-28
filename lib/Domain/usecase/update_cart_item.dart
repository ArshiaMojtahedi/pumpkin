import 'package:appwrite/models.dart';
import 'package:dartz/dartz.dart';
import 'package:pumpkin/Data/model/cartItem.dart';

import '../../Data/model/product.dart';
import '../../Data/network/failure.dart';
import '../../Data/request/request.dart';
import '../repository/repository.dart';
import 'base_usecase.dart';

class UpdateCartItemUseCase implements BaseUseCase<DeleteCartItemInput, void> {
  final Repository _repository;

  UpdateCartItemUseCase(this._repository);

  @override
  Future<Either<Failure, void>> execute(DeleteCartItemInput input) =>
      _repository.updateCartItem(input.id, input.count);
}

class DeleteCartItemInput {
  String id;
  int count;
  DeleteCartItemInput(this.id, this.count);
}
