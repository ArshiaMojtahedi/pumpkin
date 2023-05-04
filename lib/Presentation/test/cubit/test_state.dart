part of 'test_cubit.dart';

abstract class TestState extends Equatable {
  @override
  List<Object> get props => [];
}

class TestEmpty extends TestState {}

class TestInProgress extends TestState {}

class TestSuccesed extends TestState {
  Session data;
  TestSuccesed(this.data);
}

class TestFailed extends TestState {
  Failure msg;
  TestFailed(this.msg);
}
