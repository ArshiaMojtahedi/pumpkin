part of 'login_cubit.dart';

abstract class LoginState extends Equatable {
  @override
  List<Object> get props => [];
}

class LoginEmpty extends LoginState {}

class LoginInProgress extends LoginState {}

class LoginSuccesed extends LoginState {
  Session data;
  LoginSuccesed(this.data);
}

class LoginFailed extends LoginState {
  Failure msg;
  LoginFailed(this.msg);
}
