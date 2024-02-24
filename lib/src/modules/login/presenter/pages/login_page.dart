import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 64),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Image.asset(
              CeslaImages.icon.path,
              package: 'design_system',
            ),
            const SizedBox(height: 48),
            const Row(
              children: [
                Expanded(
                  child: CeslaTextField(
                    labelText: 'Usuário',
                    prefixIcon: Icons.person_outline,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Row(
              children: [
                Expanded(
                  child: CeslaPasswordTextField(
                    initialValue: '123456',
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
                    onPressed: () {},
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
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
