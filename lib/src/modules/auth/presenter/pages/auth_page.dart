import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/mixins/validation_mixin.dart';
import '../../../../core/routes/routes.dart';
import '../stores/auth_store.dart';
import 'widgets/account_recovery_text_widget.dart';

class AuthPage extends StatefulWidget {
  final AuthStore authStore;

  const AuthPage({super.key, required this.authStore});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> with ValidationMixin {
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

      if (widget.authStore.value.isError) {
        final errorMessage = widget.authStore.value.asError.exception.message;

        CeslaErrorToast.show(context, errorMessage);
      }
    });
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
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
              CeslaImage(
                path: CeslaImages.icon.path,
              ),
              const SizedBox(height: 48),
              CeslaTextField(
                labelText: 'Usuário',
                prefixIcon: Icons.person_outline,
                controller: usernameController,
                validator: isNotEmpty,
              ),
              const SizedBox(height: 16),
              CeslaPasswordTextField(
                controller: passwordController,
                validator: isNotEmpty,
              ),
              const SizedBox(height: 8),
              const AccountRecoveryText(),
              const SizedBox(height: 32),
              CeslaElevatedButton(
                title: 'Entrar',
                onPressed: signIn,
              ),
              const SizedBox(height: 16),
              CeslaOutlinedButton(
                title: 'Cadastar',
                onPressed: signUp,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void signIn() {
    if (formKey.currentState!.validate()) {
      widget.authStore.signIn(
        username: usernameController.text,
        password: passwordController.text,
      );
    }
  }

  void signUp() {
    if (formKey.currentState!.validate()) {
      widget.authStore.signUp(
        username: usernameController.text,
        password: passwordController.text,
      );
    }
  }
}
