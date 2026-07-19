import '/auth/firebase_auth/auth_util.dart';
import '/components/pain_to_gain_bottom_nav_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'journey_page_widget.dart' show JourneyPageWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class JourneyPageModel extends FlutterFlowModel<JourneyPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for PainToGainBottomNav component.
  late PainToGainBottomNavModel painToGainBottomNavModel;

  @override
  void initState(BuildContext context) {
    painToGainBottomNavModel =
        createModel(context, () => PainToGainBottomNavModel());
  }

  @override
  void dispose() {
    painToGainBottomNavModel.dispose();
  }
}
