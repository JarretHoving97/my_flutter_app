import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:new_app/HomePage/HomePage.dart';
import 'package:provider/provider.dart';

import '../authentication_service.dart';

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
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(elevation: 0, backgroundColor: Colors.blueGrey),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 20.0),
        child: Column(children: [
          Row(),
          _user.photoURL != null
              ? ClipOval(
                  child: Material(
                    color: Colors.red,
                    child: Image.network(
                      _user.photoURL!,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                )
              : const ClipOval(
                  child: Material(
                    color: Colors.red,
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
              color: Colors.white,
              fontSize: 26,
            ),
          ),
          const SizedBox(height: 8.0),
          Text(
            ' ${_user.displayName}',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 26,
            ),
          ),
          const SizedBox(height: 8.0),
          Text(
            ' ${_user.email}',
            style: const TextStyle(
              color: Colors.yellow,
              fontSize: 20,
              letterSpacing: 0.5,
            ),
          ),
          const SizedBox(height: 24.0),
          const Text(
            'Je bent nu ingelogd op je Google account. Om uit te loggen klik je op de "Log uit knop" hieronder',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              letterSpacing: 0.5,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: ElevatedButton(
                onPressed: () {
                  context.read<AuthenticationService>().singout();
                },
                child: const Text("Uitloggen")),
          )
        ]),
      )),
    );
  }
}
