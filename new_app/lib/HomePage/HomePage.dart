import 'package:flutter/material.dart';
import 'package:new_app/authentication_service.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              const Text("Home"),
              ElevatedButton(
                  onPressed: () {
                    context.read<AuthenticationService>().singout();
                  },
                  child: const Text("Uitloggen"))
            ],
          ),
        ),
      ),
    );
  }
}
