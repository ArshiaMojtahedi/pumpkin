import 'package:appwrite/models.dart';
import 'package:dartz/dartz.dart';
import 'package:pumpkin/Data/model/cartItem.dart';
import 'package:pumpkin/Data/model/product.dart';

import '../../Data/network/failure.dart';
import '../../Data/request/request.dart';
import '../repository/repository.dart';
import 'base_usecase.dart';

class CartListUseCase implements BaseUseCase<NoParameters, List<CartItem>> {
  final Repository _repository;

  CartListUseCase(this._repository);

  @override
  Future<Either<Failure, List<CartItem>>> execute(NoParameters p) =>
      _repository.getCartItems();
}
