import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;

class LocalNotifications {
  static final FlutterLocalNotificationsPlugin _flutterNotifPlug =
      FlutterLocalNotificationsPlugin();

  static Future<void> init() async {
    // initialise the plugin. app_icon needs to be a added as a drawable resource to the Android head project
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    const DarwinInitializationSettings initializationSettingsDarwin =
        DarwinInitializationSettings();
    const LinuxInitializationSettings initializationSettingsLinux =
        LinuxInitializationSettings(defaultActionName: 'Open notification');
    const InitializationSettings initializationSettings =
        InitializationSettings(
            android: initializationSettingsAndroid,
            iOS: initializationSettingsDarwin,
            linux: initializationSettingsLinux);
    await _flutterNotifPlug.initialize(initializationSettings,
        onDidReceiveNotificationResponse: (details) => null);
    _flutterNotifPlug
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.requestNotificationsPermission();
  }

  static Future showNotif(
      {required String title,
      required String body,
      required String payload}) async {
    const AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails('your channel id', 'your channel name',
            channelDescription: 'your channel description',
            importance: Importance.max,
            priority: Priority.high,
            ticker: 'ticker');
    const NotificationDetails notificationDetails =
        NotificationDetails(android: androidNotificationDetails);
    await _flutterNotifPlug.show(0, title, body, notificationDetails,
        payload: 'item x');
  }

  static Future reminderNotif(
      {required String title,
      required String body,
      required String payload}) async {
    const AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails('channel 2', 'channel name',
            channelDescription: 'description',
            importance: Importance.max,
            priority: Priority.high,
            ticker: 'ticker');
    const NotificationDetails notificationDetails =
        NotificationDetails(android: androidNotificationDetails);
    await _flutterNotifPlug.periodicallyShow(
        1, title, body, RepeatInterval.everyMinute, notificationDetails,
        androidScheduleMode: AndroidScheduleMode.exact, payload: 'item x');
  }

  static Future reminderNotificatio({
    required String title,
    required String body,
    required String payload,
    required DateTime scheduledTime,
  }) async {
    final tz.TZDateTime tzScheduledDate =
        tz.TZDateTime.from(scheduledTime, tz.local);

    const AndroidNotificationDetails androidDetails =
        AndroidNotificationDetails(
      'reminder_channel',
      'Reminder Notifications',
      channelDescription: 'Reminders set by user',
      importance: Importance.max,
      priority: Priority.high,
    );

    const NotificationDetails notificationDetails =
        NotificationDetails(android: androidDetails);

    await _flutterNotifPlug.zonedSchedule(
      scheduledTime.millisecondsSinceEpoch ~/ 1000, // unique ID
      title,
      body,
      tzScheduledDate,
      notificationDetails,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      matchDateTimeComponents: DateTimeComponents.time,
      // uiLocalNotificationDateInterpretation:
      //     UILocalNotificationDateInterpretation.absoluteTime,
    );
  }
}
