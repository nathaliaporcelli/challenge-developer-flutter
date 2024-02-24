sealed class AuthState {
  bool get isLoading => this is AuthLoadingState;
  bool get isSuccess => this is AuthSuccessState;
}

class AuthInitialState extends AuthState {}

class AuthLoadingState extends AuthState {}

class AuthErrorState extends AuthState {}

class AuthSuccessState extends AuthState {}
