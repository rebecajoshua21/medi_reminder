import 'package:becky_app/controllers/notificationCon.dart';
import 'package:becky_app/controllers/reminders_controller.dart';
import 'package:becky_app/page/home_page.dart';
import 'package:becky_app/page/intro_page.dart';
// import 'package:becky_app/page/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:provider/provider.dart';
import 'package:timezone/data/latest.dart' as tzdata;
import 'package:timezone/timezone.dart' as tz;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  tzdata.initializeTimeZones();
  tz.setLocalLocation(
      tz.getLocation('Africa/Nairobi')); // or 'UTC' or your preferred zone
  Gemini.init(apiKey: "AIzaSyCtahZHGAlJn0xHUmd4MkIEcNyxHL94YPY");
  LocalNotifications.init();
  // LocalNotifications.reminderNotif(
  //     title: "medical reminder",
  //     body: "body here",
  //     payload: "some payload here");
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => RemindersController()),
      ],
      child: MyApp(),
    ),
  );
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
