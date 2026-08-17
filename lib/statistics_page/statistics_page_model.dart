import '/flutter_flow/flutter_flow_util.dart';
import '/components/pain_to_gain_bottom_nav_widget.dart';
import 'package:flutter/material.dart';

class StatisticsPageModel extends FlutterFlowModel {
  // Model state variables
  DateTime selectedMonth = DateTime(DateTime.now().year, DateTime.now().month, 1); // Default to July 2026 as per designs

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
