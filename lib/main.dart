import 'package:becky_app/controllers/notificationCon.dart';
import 'package:becky_app/page/home_page.dart';
import 'package:becky_app/page/intro_page.dart';
// import 'package:becky_app/page/signup_page.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  LocalNotifications.init();
  LocalNotifications.reminderNotif(
      title: "medical reminder",
      body: "body here",
      payload: "some payload here");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: IntroPage(),
    );
  }
}
