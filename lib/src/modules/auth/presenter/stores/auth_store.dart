import 'package:flutter/material.dart';

import '../../../../core/exceptions/cesla_exceptions.dart';
import '../../domain/dtos/sign_in_dto.dart';
import '../../domain/dtos/sign_up_dto.dart';
import '../../domain/repositories/i_auth_repository.dart';
import 'states/auth_state.dart';

class AuthStore extends ValueNotifier<AuthState> {
  final IAuthRepository authRepository;

  AuthStore(this.authRepository) : super(AuthInitialState());

  void _setValue(AuthState state) {
    value = state;
  }

  Future<void> signIn({
    required String username,
    required String password,
  }) async {
    try {
      _setValue(AuthLoadingState());

      await authRepository.signInUser(
        SignInDTO(username: username, password: password),
      );

      _setValue(AuthSuccessState());
    } on CeslaException catch (e) {
      _setValue(AuthErrorState(e));
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
    } on CeslaException catch (e) {
      _setValue(AuthErrorState(e));
    }
  }
}
