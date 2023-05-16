import 'package:appwrite/models.dart';
import 'package:dartz/dartz.dart';
import 'package:pumpkin/Data/model/cartItem.dart';

import '../../Data/model/product.dart';
import '../../Data/network/failure.dart';
import '../../Data/request/request.dart';
import '../repository/repository.dart';
import 'base_usecase.dart';

class AddToCartUseCase implements BaseUseCase<AddToCartUseInput, void> {
  final Repository _repository;

  AddToCartUseCase(this._repository);

  @override
  Future<Either<Failure, void>> execute(AddToCartUseInput input) =>
      _repository.addCartItem(input.cartItem, input.count);
}

class AddToCartUseInput {
  CartItem cartItem;
  int count;
  AddToCartUseInput(this.cartItem, this.count);
}
