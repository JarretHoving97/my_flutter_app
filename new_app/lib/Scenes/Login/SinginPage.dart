import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:new_app/Firebase/authentication_service.dart';
import 'package:provider/provider.dart';

// ignore: use_key_in_widget_constructors
class SignInPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Login"),
          elevation: 0,
          backgroundColor: Colors.white10,
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 80,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
              child: Image.asset('assets/images/dac-logo.png'),
            ),
            const SizedBox(
              width: 280,
              child: Center(
                child: Text("Welkom bij Volleybal Dedemsvaart!",
                    style: TextStyle(fontSize: 25), textAlign: TextAlign.left),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const SizedBox(
                width: 280, child: Text("Login om verder in de app te gaan")),
            const SizedBox(height: 40),
            const Center(child: LoginButtonList()),
          ],
        ));
  }
}

// column that contains buttons
class LoginButtonList extends StatelessWidget {
  const LoginButtonList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SignInButton(Buttons.Google,
            text: "Login met Google",
            onPressed: () =>
                {context.read<AuthenticationService>().signInWithGoogle()}),
        SignInButton(Buttons.Facebook,
            text: "Login met Facebook", onPressed: () => {}),
        SignInButton(Buttons.Twitter,
            text: "Login met Twitter", onPressed: () => {})
      ],
    );
  }
}
