import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:new_app/Scenes/News/NewsPage.dart';
import 'package:new_app/Util/AppColor.dart';
import 'package:provider/provider.dart';

import '../../Firebase/authentication_service.dart';

class UserInfoScreen extends StatefulWidget {
  const UserInfoScreen({Key? key, required User user})
      : _user = user,
        super(key: key);

  final User _user;

  @override
  State<UserInfoScreen> createState() => _UserInfoScreenState();
}

class _UserInfoScreenState extends State<UserInfoScreen> {
  late User _user;

  @override
  void initState() {
    _user = widget._user;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.appBackground,
      appBar: AppBar(elevation: 0, backgroundColor: AppColor.appBackground),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 20.0),
        child: Column(children: [
          Row(),
          _user.photoURL != null
              ? ClipOval(
                  child: Material(
                    color: AppColor.appColor,
                    child: Image.network(
                      _user.photoURL!,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                )
              : const ClipOval(
                  child: Material(
                    color: AppColor.appColor,
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Icon(
                        Icons.person,
                        size: 60,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
          const SizedBox(height: 16.0),
          const Text(
            'Hallo',
            style: TextStyle(
              color: AppColor.textColor,
              fontSize: 26,
            ),
          ),
          const SizedBox(height: 2.0),
          Text(
            ' ${_user.displayName}',
            style: const TextStyle(
              color: AppColor.textColor,
              fontSize: 26,
            ),
          ),
          const SizedBox(height: 8.0),
          Text(
            ' (${_user.email})',
            style: const TextStyle(
              color: AppColor.hilightedTextColor,
              fontSize: 20,
              letterSpacing: 0.5,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const SizedBox(
            width: 290,
            child: Text(
              'Je bent nu ingelogd op je Google account. Om uit te loggen klik je op de "Uitloggen" knop hieronder',
              style: TextStyle(
                color: AppColor.textColor,
                fontSize: 14,
                letterSpacing: 0.5,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      context.read<AuthenticationService>().singout();
                    },
                    child: const Text("Uitloggen"),
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            AppColor.appColor))),
                const SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const NewsPage()),
                    );
                  },
                  child: Text("Ga door"),
                  style: ElevatedButton.styleFrom(
                    primary: AppColor.appBackground,
                    onPrimary: AppColor.appColor,
                  ),
                )
              ],
            ),
          ),
        ]),
      )),
    );
  }
}
