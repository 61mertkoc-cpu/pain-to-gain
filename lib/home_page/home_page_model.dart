import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/pain_to_gain_bottom_nav_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'home_page_widget.dart' show HomePageWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  Local state fields for this page.

  String randomQuoteText = 'Acı geçicidir. Disiplin sonsuzdur.';

  String randomQuoteAuthor = 'Makaveli';

  int randomQuoteIndex = 0;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in HomePage widget.
  List<QuotesRecord>? activeQuotes;
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
