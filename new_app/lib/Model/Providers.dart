import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:new_app/Network/NewsClient.dart';
import 'package:provider/provider.dart';
import 'package:new_app/Firebase/authentication_service.dart';
import 'package:new_app/Firebase/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providers = [
  Provider<AuthenticationService>(
    create: (_) => AuthenticationService(FirebaseAuth.instance),
  ),
  ChangeNotifierProvider<NewsDataProvider>(
    create: (context) => NewsDataProvider(),
  )
];
