import 'package:equatable/equatable.dart';

abstract class RegisterEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class RegisterSubmit extends RegisterEvent {
  final String email;
  final String password;

  RegisterSubmit(this.email, this.password);

  @override
  List<Object> get props => [email, password];
}

abstract class RegisterState extends Equatable {
  @override
  List<Object> get props => [];
}

class RegisterInitial extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterSuccess extends RegisterState {
  final String message;

  RegisterSuccess(this.message);

  @override
  List<Object> get props => [message];
}

class RegisterError extends RegisterState {
  final String error;

  RegisterError(this.error);

  @override
  List<Object> get props => [error];
}
