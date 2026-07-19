import 'dart:math';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'schema/users_record.dart';
import '/auth/firebase_auth/auth_util.dart';

class NotificationService {
  static final NotificationService _instance = NotificationService._internal();
  factory NotificationService() => _instance;
  NotificationService._internal();

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  static const List<String> _genericMessages = [
    "Kılıcın paslanıyor! Arenaya dön ve bugünkü zaferini kazan.",
    "Disiplin uyumaz. Rakiplerin çalışırken sen geride kalma, hemen hedeflerini tamamla!",
    "Gerçek bir savaşçı asla mola vermez. Bugünün görevleri seni bekliyor.",
    "Zafer, her gün antrenman yapanların elindedir. Bugünün savaşını henüz vermedin.",
    "Zaman akıp gidiyor! Rütbeni kaybetmemek için hemen arenaya dön ve gücünü kanıtla.",
    "Bahane üretme, tarih yaz! Bugünkü hedeflerini tamamlayarak gücüne güç kat.",
    "Gölgelerde saklanma vakti bitti. Kılıcını çek ve bugünkü görevleri bitir!",
    "Disiplin ateşin sönmek üzere! Onu tekrar harlamak için uygulamaya gir."
  ];

  static const List<String> _companionMessages = [
    "Yoldaşın {name} aç kaldı. Eğitime dön ve gücünü koru!",
    "{name} seni arenada bekliyor. Onu yalnız bırakma, bugünkü mücadeleyi birlikte kazanın!",
    "Efsanevi yoldaşın {name}'nin sana ihtiyacı var. Geri dön ve gücünüzü herkese gösterin.",
    "{name} bugün kılıç seslerini duymadı... Arenaya in ve onunla omuz omuza savaş!",
    "Büyük komutanların yoldaşları asla yalnız kalmaz. {name}'nin yanına git ve hedeflerini yok et."
  ];

  Future<void> init() async {
    tz.initializeTimeZones();
    
    const AndroidInitializationSettings initializationSettingsAndroid = AndroidInitializationSettings('@mipmap/ic_launcher');
    const DarwinInitializationSettings initializationSettingsIOS = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );
    
    const InitializationSettings initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );
    
    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  Future<void> requestPermissions() async {
    await flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()?.requestNotificationsPermission();
    await flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<IOSFlutterLocalNotificationsPlugin>()?.requestPermissions(
      alert: true,
      badge: true,
      sound: true,
    );
  }

  Future<void> cancelAllNotifications() async {
    await flutterLocalNotificationsPlugin.cancelAll();
  }

  String _getRandomMessage(int streakCount, String companionName) {
    final random = Random();
    List<String> pool = List.from(_genericMessages);
    
    if (streakCount >= 100) {
      // Add companion messages replacing {name} with actual companionName
      final cName = companionName.isEmpty ? 'Yoldaş' : companionName;
      final cMessages = _companionMessages.map((m) => m.replaceAll('{name}', cName)).toList();
      pool.addAll(cMessages);
    }
    
    return pool[random.nextInt(pool.length)];
  }

  Future<void> scheduleStreakNotifications(UsersRecord user) async {
    await cancelAllNotifications();

    final streakCount = user.streakCount;
    final companionName = user.companionName;

    const AndroidNotificationDetails androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'pain_to_gain_streak',
      'Streak Reminders',
      channelDescription: 'Reminders to not break your streak',
      importance: Importance.max,
      priority: Priority.high,
    );
    
    const NotificationDetails platformChannelSpecifics = NotificationDetails(android: androidPlatformChannelSpecifics);

    // Schedule 24 hour notification
    await flutterLocalNotificationsPlugin.zonedSchedule(
      1,
      'Arenaya Dön!',
      _getRandomMessage(streakCount, companionName),
      tz.TZDateTime.now(tz.local).add(const Duration(hours: 24)),
      platformChannelSpecifics,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
    );

    // Schedule 33 hour notification (1 hour before rank drop)
    await flutterLocalNotificationsPlugin.zonedSchedule(
      2,
      'Son Uyarı!',
      'Rütbeni kaybetmene sadece 1 saat kaldı! ' + _getRandomMessage(streakCount, companionName),
      tz.TZDateTime.now(tz.local).add(const Duration(hours: 33)),
      platformChannelSpecifics,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
    );
  }
}
