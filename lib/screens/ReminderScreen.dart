import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import "package:googleapis_auth/auth_io.dart" as googleApi;
import 'package:googleapis/calendar/v3.dart';

import '../widgets/CustomDrawer.dart';

class ReminderScreen extends StatefulWidget {
  // const ReminderScreen({Key key}) : super(key: key);
  @override
  _ReminderScreenState createState() => _ReminderScreenState();
}

class _ReminderScreenState extends State<ReminderScreen> {
  DateTime selectedDate = DateTime.now();
  static const _scopes = const [CalendarApi.CalendarScope];

  var _credentials = new googleApi.ClientId(
      "475392313024-t6ok4tb7qe9pd7geqngcc9ub02phe0kh.apps.googleusercontent.com",
      "");

  insertEvent(event) {
    try {
      googleApi.clientViaUserConsent(_clientID, _scopes, prompt)
          .then((AuthClient client) {
        var calendar = CalendarApi(client);
        String calendarId = "primary";
        calendar.events.insert(event, calendarId).then((value) {
          print("ADDEDDD_________________${value.status}");
          if (value.status == "confirmed") {
            log('Event added in google calendar');
          } else {
            log("Unable to add event in google calendar");
          }
        });
      });
    } catch (e) {
      log('Error creating event $e');
    }
  }

  void prompt(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate, // Refer step 1
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Set Reminder"),
        ),
        drawer: CustomDrawer(),
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              "${selectedDate.toLocal()}".split(' ')[0],
              style: TextStyle(fontSize: 55, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20.0,
            ),
            RaisedButton(
              onPressed: () => _selectDate(context), // Refer step 3
              child: Text(
                'Select date',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              color: Colors.greenAccent,
            ),
          ],
        ),
      ),
    );
  }
}
