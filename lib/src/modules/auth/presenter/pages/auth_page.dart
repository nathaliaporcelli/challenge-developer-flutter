import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/routes/routes.dart';
import '../stores/auth_store.dart';

class AuthPage extends StatefulWidget {
  final AuthStore authStore;

  const AuthPage({super.key, required this.authStore});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();

    widget.authStore.addListener(() {
      if (widget.authStore.value.isSuccess) {
        context.go(Routes.dashboard.path);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 64),
        child: Form(
          key: formKey,
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
                      controller: usernameController,
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
                      controller: passwordController,
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
                      onPressed: () => widget.authStore.signIn(
                        username: usernameController.text,
                        password: passwordController.text,
                      ),
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
                      onPressed: () => widget.authStore.signUp(
                        username: usernameController.text,
                        password: passwordController.text,
                      ),
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
