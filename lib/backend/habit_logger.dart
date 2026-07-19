import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/index.dart';

class ParsedLog {
  final DateTime date;
  final List<String> completed;
  final List<String> total;

  ParsedLog({
    required this.date,
    required this.completed,
    required this.total,
  });
}

class HabitLogger {
  static DateTime get today {
    final now = DateTime.now();
    return DateTime(now.year, now.month, now.day);
  }

  static String get todayStr {
    final t = today;
    return "${t.year}-${t.month.toString().padLeft(2, '0')}-${t.day.toString().padLeft(2, '0')}";
  }

  // Parses user habit_history list of JSON strings.
  static List<ParsedLog> getParsedLogs(List<dynamic> rawHistory) {
    final List<ParsedLog> logs = [];
    for (var item in rawHistory) {
      if (item is String) {
        try {
          final decoded = jsonDecode(item) as Map<String, dynamic>;
          final dateStr = decoded['date'] as String;
          final parts = dateStr.split('-');
          final date = DateTime(int.parse(parts[0]), int.parse(parts[1]), int.parse(parts[2]));
          logs.add(ParsedLog(
            date: date,
            completed: List<String>.from(decoded['completed'] ?? []),
            total: List<String>.from(decoded['total'] ?? []),
          ));
        } catch (_) {}
      }
    }
    return logs;
  }

  // Updates the daily log for today in the user's habit_history.
  static Future<void> updateGoalLog({
    required DocumentReference userRef,
    required DocumentReference goalRef,
    required bool isCompleted,
  }) async {
    final userSnap = await userRef.get();
    if (!userSnap.exists) return;

    final userData = userSnap.data() as Map<String, dynamic>? ?? {};
    final List<String> history = List<String>.from(userData['habit_history'] ?? []);

    final dateKey = todayStr;
    final goalId = goalRef.id;

    int todayIndex = -1;
    Map<String, dynamic> todayLog = {};

    for (int i = 0; i < history.length; i++) {
      try {
        final decoded = jsonDecode(history[i]) as Map<String, dynamic>;
        if (decoded['date'] == dateKey) {
          todayIndex = i;
          todayLog = decoded;
          break;
        }
      } catch (_) {}
    }

    // Get all active goals for today
    final activeGoalsSnapshot = await FirebaseFirestore.instance
        .collection('goals')
        .where('user_ref', isEqualTo: userRef)
        .where('is_active', isEqualTo: true)
        .get();
    final activeGoalIds = activeGoalsSnapshot.docs.map((doc) => doc.reference.id).toList();

    List<String> completedIds = [];
    if (todayIndex != -1) {
      completedIds = List<String>.from(todayLog['completed'] ?? []);
    }

    if (isCompleted) {
      if (!completedIds.contains(goalId)) {
        completedIds.add(goalId);
      }
    } else {
      completedIds.remove(goalId);
    }

    final newTodayLog = {
      'date': dateKey,
      'completed': completedIds,
      'total': activeGoalIds,
    };

    final newTodayLogStr = jsonEncode(newTodayLog);

    if (todayIndex != -1) {
      history[todayIndex] = newTodayLogStr;
    } else {
      history.add(newTodayLogStr);
    }

    await userRef.update({
      'habit_history': history,
    });
  }

  // Checks if a new day has arrived. If so, resets all active goals to not completed.
  static Future<void> checkAndResetDailyGoals({required DocumentReference userRef}) async {
    final todayDate = today;

    final userSnap = await userRef.get();
    if (!userSnap.exists) return;

    final userData = userSnap.data() as Map<String, dynamic>? ?? {};
    final Timestamp? lastCompletedTimestamp = userData['last_completed_date'] as Timestamp?;
    
    DateTime? lastCompletedDate = lastCompletedTimestamp?.toDate();
    if (lastCompletedDate != null) {
      lastCompletedDate = DateTime(lastCompletedDate.year, lastCompletedDate.month, lastCompletedDate.day);
    }

    if (lastCompletedDate == null || lastCompletedDate.isBefore(todayDate)) {
      // Fetch active goals
      final activeGoalsSnapshot = await FirebaseFirestore.instance
          .collection('goals')
          .where('user_ref', isEqualTo: userRef)
          .where('is_active', isEqualTo: true)
          .get();

      final batch = FirebaseFirestore.instance.batch();

      // Reset each active goal's completion status to false
      for (var doc in activeGoalsSnapshot.docs) {
        batch.update(doc.reference, {'is_completed': false});
      }

      // Initialize today's log in user's history if not exists
      final List<String> history = List<String>.from(userData['habit_history'] ?? []);
      final dateKey = todayStr;

      bool hasTodayLog = false;
      for (var item in history) {
        try {
          final decoded = jsonDecode(item) as Map<String, dynamic>;
          if (decoded['date'] == dateKey) {
            hasTodayLog = true;
            break;
          }
        } catch (_) {}
      }

      if (!hasTodayLog) {
        final activeGoalIds = activeGoalsSnapshot.docs.map((doc) => doc.reference.id).toList();
        final newTodayLog = {
          'date': dateKey,
          'completed': <String>[],
          'total': activeGoalIds,
        };
        history.add(jsonEncode(newTodayLog));
        batch.update(userRef, {'habit_history': history});
      }

      // Check for 34 hours passed since last completed date
      if (lastCompletedDate != null) {
        final hoursDiff = DateTime.now().difference(lastCompletedDate).inHours;
        if (hoursDiff >= 34) {
          final currentStreak = userData['streak_count'] as int? ?? 0;
          final newStreak = _getBaseStreakLevel(currentStreak);
          batch.update(userRef, {'streak_count': newStreak});
        }
      }

      batch.update(userRef, {'last_completed_date': todayDate});

      await batch.commit();
    }
  }

  static int _getBaseStreakLevel(int current) {
    if (current <= 2) return 0;
    if (current <= 6) return 3;
    if (current <= 13) return 7;
    if (current <= 20) return 14;
    if (current <= 29) return 21;
    if (current <= 44) return 30;
    if (current <= 59) return 45;
    if (current <= 89) return 60;
    if (current <= 99) return 90;
    if (current <= 149) return 100;
    if (current <= 199) return 150;
    if (current <= 249) return 200;
    if (current < 299) return 250;
    if (current <= 364) return 300;
    return 365;
  }
}
