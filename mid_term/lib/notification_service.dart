import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotificationService {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  Future<void> initialize() async {
    // Initialize time zones
    tz.initializeTimeZones();
    tz.setLocalLocation(tz.getLocation('America/Detroit')); // Adjust to the appropriate timezone for your location

    const AndroidInitializationSettings initializationSettingsAndroid = AndroidInitializationSettings('@mipmap/ic_launcher');
    final InitializationSettings initializationSettings = InitializationSettings(android: initializationSettingsAndroid);
    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  Future<void> scheduleNotification(String title, String body, DateTime scheduledDate) async {
    await flutterLocalNotificationsPlugin.zonedSchedule(
      0, // Unique ID for this notification
      title,
      body,
      tz.TZDateTime.from(scheduledDate, tz.local), // Convert DateTime to TZDateTime
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'task_channel',
          'Task Notifications',
          channelDescription: 'Notify user about task deadlines',
          importance: Importance.high,
          priority: Priority.high,
        ),
      ),
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
      matchDateTimeComponents: DateTimeComponents.time, // Schedule based on date and time
    );
  }
}
