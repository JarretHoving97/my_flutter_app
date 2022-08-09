import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:new_app/Model/EventModel.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class EventClient {
  static const String eventListEndpoint =
      "http://192.168.0.102:8080/admin/event/all";
}

class EventDataprovider with ChangeNotifier {
  late List<EventModel> events;

  bool loading = false;

  fetch(context) async {
    loading = true;

    events = await fetchEventsData(context);

    loading = false;

    notifyListeners();
  }
}

Future<List<EventModel>> fetchEventsData(context) async {
  late List<EventModel> events;

  try {
    final response = await http.get(Uri.parse(EventClient.eventListEndpoint));
    if (response.statusCode == 200) {
      final List parsedList = json.decode(response.body);
      List<EventModel> list =
          parsedList.map((e) => EventModel.fromJson(e)).toList();
      events = list;
    }
  } catch (e) {
    print("error fetching event data");
  }

  return events;
}
