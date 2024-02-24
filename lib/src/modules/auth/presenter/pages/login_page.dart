import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import '../../../../core/services/injector/app_injector.dart';
import '../controllers/login_controller.dart';

class LoginPage extends StatefulWidget {
//final LoginController loginController;

  const LoginPage({
    super.key,
    // required this.loginController,
  });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final loginController = AppInjector.retrive<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 64),
        child: Form(
          key: loginController.formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Image.asset(
                CeslaImages.icon.path,
                package: 'design_system',
              ),
              const SizedBox(height: 48),
              Row(
                children: [
                  Expanded(
                    child: CeslaTextField(
                      labelText: 'Usuário',
                      prefixIcon: Icons.person_outline,
                      onSaved: (value) {
                        loginController.username = value!;
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Campo obrigatório';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: CeslaPasswordTextField(
                      onSaved: (value) {
                        loginController.password = value!;
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 64),
              Row(
                children: [
                  Expanded(
                    child: CeslaElevatedButton(
                      title: 'Entrar',
                      onPressed: loginController.signIn,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: CeslaOutlinedButton(
                      title: 'Cadastar',
                      onPressed: loginController.signUp,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
