import 'package:flutter/material.dart';
import 'package:new_app/authentication_service.dart';
import 'package:provider/provider.dart';

// ignore: use_key_in_widget_constructors
class SignInPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: "Email",
              ),
            ),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(
                labelText: "Wachtwoord",
              ),
            ),
            ElevatedButton(
                onPressed: () => {
                      // Login code
                      context.read<AuthenticationService>().signIn(
                          email: emailController.text.trim(),
                          password: passwordController.text.trim())
                    },
                child: const Text("Login"))
          ],
        ),
      ),
    );
  }
}
