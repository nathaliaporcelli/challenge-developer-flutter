import '../../../../../core/exceptions/cesla_exceptions.dart';

sealed class AuthState {
  bool get isLoading => this is AuthLoadingState;
  bool get isError => this is AuthErrorState;
  AuthErrorState get asError => this as AuthErrorState;
  bool get isSuccess => this is AuthSuccessState;
}

class AuthInitialState extends AuthState {}

class AuthLoadingState extends AuthState {}

class AuthErrorState extends AuthState {
  final CeslaException exception;

  AuthErrorState(this.exception);
}

class AuthSuccessState extends AuthState {}
