import 'package:appwrite/models.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:pumpkin/App/dartz_x.dart';
import 'package:pumpkin/Data/network/failure.dart';
import 'package:pumpkin/Domain/usecase/login_usecase.dart';

import '../../../App/app_preferences.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginUseCase loginUseCase;
  final AppPreferences appPreferences;

  LoginCubit({required this.loginUseCase, required this.appPreferences})
      : super(LoginEmpty());

  login(String email, String password) {
    emit(LoginInProgress());

    loginUseCase
        .execute(LoginUseCaseInput(email, password))
        .then((value) async {
      if (value.isRight()) {
        //Save user
        await appPreferences.setSessionIds(
            value.asRight().$id, value.asRight().userId);

        emit(LoginSuccesed(value.asRight()));
      } else if ((value.isLeft())) {
        emit(LoginFailed((value.asLeft())));
      }
    });
  }
}
