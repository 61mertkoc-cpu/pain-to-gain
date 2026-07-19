import '/flutter_flow/flutter_flow_util.dart';
import '/components/pain_to_gain_bottom_nav_widget.dart';
import 'package:flutter/material.dart';

class SettingsPageModel extends FlutterFlowModel {
  // Model state variables
  bool isNotificationsEnabled = true;
  String selectedLanguage = 'tr';

  // Bottom navigation model
  late PainToGainBottomNavModel painToGainBottomNavModel;

  @override
  void initState(BuildContext context) {
    painToGainBottomNavModel = createModel(context, () => PainToGainBottomNavModel());
  }

  @override
  void dispose() {
    painToGainBottomNavModel.dispose();
  }
}
