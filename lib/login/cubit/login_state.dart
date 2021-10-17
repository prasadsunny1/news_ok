part of 'login_cubit.dart';

@immutable
abstract class LoginState extends Equatable {}

class LoginInitial extends LoginState {
  @override
  List<Object?> get props => [];
}

class LoggingInState extends LoginState {
  @override
  List<Object?> get props => [];
}

class LoginSuccessState extends LoginState {
  @override
  List<Object?> get props => [];
}

class LoginFailed extends LoginState {
  LoginFailed({required this.message});

  final String message;
  @override
  List<Object?> get props => [message];
}
