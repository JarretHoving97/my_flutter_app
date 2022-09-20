// ignore: file_names
import 'dart:convert';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:new_app/Model/NewsModel.dart';
import 'package:http/http.dart' as http;
import 'package:new_app/Model/RegisterResponse.dart';
import 'package:new_app/Network/EnvironmentClient.dart';

class OnboardingClient {
  static String postOnboardingUrl =
      "${EnvironmentClient.BaseUrl}auth/onboarding";
}

Future<RegisteResponse?> sendOnboardingInfo(
    User user, String phone, String fullName, String? membershipNumber) async {
  final json = {
    "id": user.uid.toString(),
    "first_name": fullName,
    "membership": membershipNumber,
    "phone": phone
  };
  final response = await http
      .post(Uri.parse(OnboardingClient.postOnboardingUrl), body: json);

  if (response.statusCode == 201) {
    return RegisteResponse.fromJson(jsonDecode(response.body));
  } else {
    return null;
  }
}
