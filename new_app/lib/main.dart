import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:new_app/Model/LocalUserModel.dart';
import 'package:new_app/Model/Providers.dart';
import 'package:new_app/Network/AccessClient.dart';
import 'package:new_app/Scenes/Onboarding/UserInfoPage.dart';
import 'package:new_app/Scenes/Onboarding/UserInfoScreen.dart';
import 'package:new_app/Scenes/Tabbar/BottomNavBar.dart';
import 'package:new_app/Util/AppColor.dart';
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
            visualDensity: VisualDensity.adaptivePlatformDensity,
            bottomSheetTheme:
                BottomSheetThemeData(backgroundColor: AppColor.appBackground)),
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
      // user has logged in.
      // check now for app access
      LocalUserModel.shared.user = user;
      return const UserAccesLoadingWidget();
    }
    return const HomePage();
  }
}

class UserAccesLoadingWidget extends StatefulWidget {
  const UserAccesLoadingWidget({Key? key}) : super(key: key);

  @override
  State<UserAccesLoadingWidget> createState() => _UserAccesLoadingWidgetState();
}

class _UserAccesLoadingWidgetState extends State<UserAccesLoadingWidget> {
  @override
  void initState() {
    super.initState();

    final accessData = Provider.of<AccessAppProviver>(context, listen: false);
    accessData.fetchAccess(context);
  }

  @override
  Widget build(BuildContext context) {
    AccessAppProviver accessor = Provider.of<AccessAppProviver>(context);
    return accessor.loading
        ? const CircularProgressIndicator()
        : accessor.hasAccess.registered
            ? const BottomNavBar()
            : UserInfoScreen(user: LocalUserModel.shared.user);
  }
}
