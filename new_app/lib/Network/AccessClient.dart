import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:new_app/Model/EventModel.dart';
import 'package:new_app/Model/LocalUserModel.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:new_app/Model/AccessModel';

class AccessClient {
  static const checkAccessEndpont = "http://192.168.0.102:8080/auth/access/";
}

class AccessAppProviver with ChangeNotifier {
  late AccessModel hasAccess;

  bool loading = false;

  fetchAccess(context) async {
    loading = true;

    hasAccess = await checkForAcccess(context);

    loading = false;

    notifyListeners();
  }
}

Future<AccessModel> checkForAcccess(context) async {
  late AccessModel hasAccess;
  String url = AccessClient.checkAccessEndpont + LocalUserModel.shared.user.uid;
  try {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      Map<String, dynamic> map = json.decode(response.body);
      hasAccess = AccessModel.fromJson(map);
    } else {
      print("error  " + response.statusCode.toString());
      print(url);
    }
  } catch (e) {
    print("error fetching for app access " + e.toString());
  }

  return hasAccess;
}
