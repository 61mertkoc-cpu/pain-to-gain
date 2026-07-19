// import 'package:home_widget/home_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '/backend/schema/users_record.dart';
import '/backend/quotes_repository.dart';
import 'localization_manager.dart';

class WidgetHelper {
  static const String appGroupId = 'group.com.mertkoc.paintogain'; // Replace if using iOS App Groups
  static const String androidWidgetName = 'WarriorWidgetProvider';

  static Future<void> updateWidgetQuote() async {
    return; // DISABLED FOR SCREENSHOTS
  }
}
