import 'package:flutter/material.dart';

import '../../../../core/services/injector/app_injector.dart';
import '../../domain/dtos/sign_in_dto.dart';
import '../../domain/dtos/sign_up_dto.dart';
import '../../domain/repositories/auth_repository.dart';

class LoginController {
  final authService = AppInjector.retrive<AuthRepository>();

  final formKey = GlobalKey<FormState>();
  String username = '';
  String password = '';

  void signIn() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();

      authService.signInUser(SignInDTO(username: username, password: password));
    }
  }

  void signUp() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();

      authService.signUpUser(SignUpDTO(username: username, password: password));
    }
  }
}
