import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import '/index.dart';
import '/components/pain_to_gain_bottom_nav_widget.dart';
import 'goals_page_widget.dart' show GoalsPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class GoalsPageModel extends FlutterFlowModel<GoalsPageWidget> {
  ///  Local state fields for this page.

  DocumentReference? selectedGoalRef;

  String? selectedGoalText;

  bool showGoalEditor = false;

  String selectedCategory = 'dumbbell';

  ///  State fields for stateful widgets in this page.

  late PainToGainBottomNavModel painToGainBottomNavModel;

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for Switch widget.
  bool? switchValue;

  @override
  void initState(BuildContext context) {
    painToGainBottomNavModel = createModel(context, () => PainToGainBottomNavModel());
  }

  @override
  void dispose() {
    painToGainBottomNavModel.dispose();
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();
  }
}
