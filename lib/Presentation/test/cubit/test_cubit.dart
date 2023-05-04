import 'package:appwrite/models.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:pumpkin/App/dartz_x.dart';
import 'package:pumpkin/Data/network/failure.dart';
import 'package:pumpkin/Domain/usecase/login_usecase.dart';

part 'test_state.dart';

class TestCubit extends Cubit<TestState> {
  LoginUseCase loginUseCase;

  TestCubit({required this.loginUseCase}) : super(TestEmpty());

  fetch() {
    emit(TestInProgress());

    loginUseCase
        .execute(LoginUseCaseInput('test@gmail.com', '12345678'))
        .then((value) async {
      if (value.isRight()) {
        emit(TestSuccesed(value.asRight()));
      } else if ((value.isLeft())) {
        emit(TestFailed((value.asLeft())));
      }
    });
  }
}
