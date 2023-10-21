part of 'register_cubit.dart';

@immutable
abstract class RegisterState {}

class RegisterStateInitial extends RegisterState {}
class RegisterStateShowLoading extends RegisterState {}
class RegisterStateSuccess extends RegisterState {
  final RegisterEntity model;
  RegisterStateSuccess(this.model);
}
class RegisterStateFailure extends RegisterState {
   Failures failures;
  RegisterStateFailure(this.failures);
}
