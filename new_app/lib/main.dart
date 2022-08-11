import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:new_app/Model/LocalUserModel.dart';
import 'package:new_app/Model/Providers.dart';
import 'package:new_app/Scenes/Onboarding/UserInfoScreen.dart';
import 'Firebase/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:new_app/Scenes/Home/HomePage.dart';
import 'package:new_app/Scenes/Login/SinginPage.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: MaterialApp(
        title: "Flutter Demo",
        theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity),
        home: const AuthenticationWrapper(),
      ),
    );
  }
}

class AuthenticationWrapper extends StatelessWidget {
  const AuthenticationWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firebaseuser = context.watch<User?>();

    User? user = FirebaseAuth.instance.currentUser;
    if (firebaseuser == null) {
      return SignInPage();
    } else if (user != null) {
      // set user data to shared preference
      LocalUserModel.shared.user = user;

      return UserInfoScreen(user: user);
    }
    return const HomePage();
  }
}
