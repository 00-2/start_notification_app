


import 'dart:async';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:http/http.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'notification_api.dart';
void main() {
  AwesomeNotifications().initialize(
      'resource://drawable/res_notification_app_icon',
      [
        NotificationChannel(
            channelKey: 'basic_channel',
            channelName: 'Basic notifications',
            channelDescription: 'Notification channel for basic tests',
            defaultColor: Color(0xFF9D50DD),
            ledColor: Colors.white,
            soundSource: 'resource://raw/res_custom_notification',
        )
      ],
  );
  runApp(MyApp());
}

class MyApp extends StatefulWidget{
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isYandexOnline = true;
  final String url = "http://51.250.13.43:5000";
  int minutes = 0;
  final int wait_minutes = 2;
  Client client = Client();
  @override
  void initState() {
    Timer mytimer = Timer.periodic(Duration(seconds: wait_minutes), (timer) async {
      try {
        final request = await client.get(Uri.parse(url))
            .timeout(const Duration(seconds: 2));
        isYandexOnline = true;
      } on TimeoutException catch (_) {
        noConnectionToServerNotitfication(url, minutes);
        minutes += wait_minutes;
        isYandexOnline = false;
      } on SocketException catch (_) {
        isYandexOnline = false;
      }
      setState(() {
      });
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Test App",
        home: Scaffold(
            appBar: AppBar(
              title:Text("Execute Code With Timer"),
              backgroundColor: Colors.redAccent,
            ),
            body: Container(
                height: 260,
                color: Colors.green.shade50,
                child: Center(
                  child: Text(
                    isYandexOnline.toString(),
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                  //show time on UI
                )
            )
        )
    );
  }
}