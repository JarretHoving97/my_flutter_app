import 'package:firebase_auth/firebase_auth.dart';

class LocalUserModel {
  static LocalUserModel shared = LocalUserModel();
  late User user;
  late ExternalInfo userExternalInfo;
}

// Intenral info
class ExternalInfo {
  late String membershipNumber;
  late String phoneNumber;
}
