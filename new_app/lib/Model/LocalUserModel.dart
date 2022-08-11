import 'package:firebase_auth/firebase_auth.dart';

class LocalUserModel {
  static LocalUserModel shared = LocalUserModel();
  late User user;
}
