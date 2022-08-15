// ignore: file_names
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:new_app/Model/NewsModel.dart';
import 'package:http/http.dart' as http;
import 'package:new_app/Network/EnvironmentClient.dart';

class OnboardingClient {
  static String postOnboardingUrl =
      "${EnvironmentClient.BaseUrl}auth/onboarding";
}

Future<http.Response> sendOnboardingInfo() {
  return http.post(Uri.parse(OnboardingClient.postOnboardingUrl),
      body: jsonEncode(<String, String>{
        "first_name": "",
        "last_name": "",
        "membership": "",
        "id": "",
        "phone": ""
      }));
}
