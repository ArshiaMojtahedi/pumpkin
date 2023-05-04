import 'package:appwrite/models.dart';

import 'package:dartz/dartz.dart';

import '../../Data/model/product.dart';
import '../../Data/network/failure.dart';
import '../../Data/request/request.dart';
import '../repository/repository.dart';
import 'base_usecase.dart';

class RegisterUseCase
    implements
        BaseUseCase<RegisterUseCaseInput, User>,
        RegisterUseCaseLogin<RegisterUseCaseInput, Session> {
  final Repository _repository;

  RegisterUseCase(this._repository);

  @override
  Future<Either<Failure, User>> execute(RegisterUseCaseInput input) =>
      _repository.register(
          LoginRequest(input.email, input.password, name: input.name));

  @override
  Future<Either<Failure, Session>> login(RegisterUseCaseInput input) =>
      _repository.login(LoginRequest(input.email, input.password));

  @override
  Future<Either<Failure, List<Product>>> getAllProducts() =>
      _repository.getAllProducts();
}

class RegisterUseCaseInput {
  String email, password, name;

  RegisterUseCaseInput(this.email, this.password, this.name);
}

abstract class RegisterUseCaseLogin<In, Out> {
  Future<Either<Failure, Out>> login(In input);
}
