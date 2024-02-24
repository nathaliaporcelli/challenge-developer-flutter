import 'package:flutter/material.dart';

import '../../domain/dtos/sign_in_dto.dart';
import '../../domain/dtos/sign_up_dto.dart';
import '../../domain/repositories/auth_repository.dart';
import 'states/auth_state.dart';

class AuthStore extends ValueNotifier<AuthState> {
  final AuthRepository authRepository;

  AuthStore(this.authRepository) : super(AuthInitialState());

  void _setValue(AuthState state) {
    value = state;
  }

  void signIn({
    required String username,
    required String password,
  }) {
    try {
      _setValue(AuthLoadingState());

      authRepository.signInUser(
        SignInDTO(username: username, password: password),
      );

      _setValue(AuthSuccessState());
    } catch (e) {
      _setValue(AuthErrorState());
    }
  }

  void signUp({
    required String username,
    required String password,
  }) {
    try {
      _setValue(AuthLoadingState());

      authRepository.signUpUser(
        SignUpDTO(username: username, password: password),
      );

      _setValue(AuthSuccessState());
    } catch (e) {
      _setValue(AuthErrorState());
    }
  }
}
