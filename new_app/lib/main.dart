import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:new_app/Scenes/Onboarding/UserInfoScreen.dart';
import 'Firebase/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:new_app/Scenes/Home/HomePage.dart';
import 'package:new_app/Scenes/Login/SinginPage.dart';
import 'package:new_app/Firebase/authentication_service.dart';
import 'package:new_app/Firebase/firebase_options.dart';
import 'package:provider/provider.dart';

import 'Scenes/News/NewsData.dart';

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
      providers: [
        Provider<AuthenticationService>(
          create: (_) => AuthenticationService(FirebaseAuth.instance),
        ),
        StreamProvider(
            initialData: null,
            create: (context) =>
                context.read<AuthenticationService>().authStateChanges),
        ChangeNotifierProvider<NewsData>(create: (context) => NewsData())
      ],
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
      return UserInfoScreen(user: user);
    }
    return const HomePage();
  }
}
