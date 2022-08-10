import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:new_app/Network/EventClient.dart';
import 'package:new_app/Util/AppColor.dart';
import 'package:provider/provider.dart';

class EventPage extends StatefulWidget {
  const EventPage({Key? key}) : super(key: key);

  @override
  State<EventPage> createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  @override
  void initState() {
    super.initState();

    final eventData = Provider.of<EventDataprovider>(context, listen: false);
    eventData.fetch(context);
  }

  @override
  Widget build(BuildContext context) {
    final eventProvider = Provider.of<EventDataprovider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Evenementen"),
        backgroundColor: AppColor.appColor,
      ),
      body: eventProvider.loading
          ? Container(
              child: const Center(
                  child: CircularProgressIndicator(
                color: AppColor.secondairyColor,
              )),
            )
          : Center(
              child: Container(child: Text(eventProvider.events[0].title))),
    );
  }
}
