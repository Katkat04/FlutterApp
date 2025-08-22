import 'package:flutter/material.dart';
import 'package:hello_world/features/authentication/widgets/login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
          ),
          child: IntrinsicHeight(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const LoginForm(),
                  const SizedBox(height: 20),
                  TextButton(
                    onPressed: () {},
                    child: const Text('¿Olvidaste tu contraseña?', style: TextStyle(fontSize: 16),),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}