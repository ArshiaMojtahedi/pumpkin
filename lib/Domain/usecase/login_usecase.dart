import 'package:appwrite/models.dart';
import 'package:dartz/dartz.dart';

import '../../Data/network/failure.dart';
import '../../Data/request/request.dart';
import '../repository/repository.dart';
import 'base_usecase.dart';

class LoginUseCase implements BaseUseCase<LoginUseCaseInput, Session> {
  final Repository _repository;

  LoginUseCase(this._repository);

  @override
  Future<Either<Failure, Session>> execute(LoginUseCaseInput input) =>
      _repository.login(LoginRequest(input.email, input.password));
}

class LoginUseCaseInput {
  String email, password;

  LoginUseCaseInput(this.email, this.password);
}
