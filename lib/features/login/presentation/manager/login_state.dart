part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitialState extends LoginState {}
class LoginShowLoadingState extends LoginState {}
class LoginSuccessState extends LoginState {

  RegisterEntity model;
  LoginSuccessState(this.model);


}
class LoginFailureState extends LoginState {

  Failures failures;
  LoginFailureState(this.failures);

}
