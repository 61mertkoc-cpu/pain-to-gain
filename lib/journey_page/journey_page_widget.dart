import '/auth/firebase_auth/auth_util.dart';
import '/components/pain_to_gain_bottom_nav_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '/backend/localization_manager.dart';
import 'journey_page_model.dart';
export 'journey_page_model.dart';

class JourneyPageWidget extends StatefulWidget {
  const JourneyPageWidget({super.key});

  static String routeName = 'JourneyPage';
  static String routePath = '/journeyPage';

  @override
  State<JourneyPageWidget> createState() => _JourneyPageWidgetState();
}

class _JourneyPageWidgetState extends State<JourneyPageWidget> {
  late JourneyPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => JourneyPageModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            child: Stack(
              children: [
                Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      'assets/images/BackGroundFix.png',
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 10.0, 0.0, 100.0),
                        child: Container(
                          width: 315.0,
                          height: 560.0,
                          decoration: BoxDecoration(
                            color: Color(0xB30D0D0D),
                            border: Border.all(
                              color: Color(0xFFD4AF37),
                              width: 2.0,
                            ),
                          ),
                          child: ListView(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            children: [
                              Text(
                                LocalizationManager.instance.t('journey_title'),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                              GridView(
                                padding: EdgeInsets.zero,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 10.0,
                                  mainAxisSpacing: 10.0,
                                  childAspectRatio: 0.78,
                                ),
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                children: [
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Expanded(
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(8.0),
                                          child: Image.asset(
                                            'assets/images/STAGE_ACEMI.png',
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 6.0),
                                      Text(
                                        LocalizationManager.instance.t('journey_acemi'),
                                        style: GoogleFonts.cinzel(
                                          color: Color(0xFFA68255),
                                          fontSize: 10.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Opacity(
                                    opacity: valueOrDefault(
                                                currentUserDocument
                                                    ?.streakCount,
                                                0) >=
                                            3
                                        ? 1.0
                                        : 0.25,
                                    child: AuthUserStreamWidget(
                                      builder: (context) => Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Expanded(
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              child: Image.asset(
                                                'assets/images/STAGE_MUHAFIZ.png',
                                                fit: BoxFit.contain,
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 6.0),
                                          Text(
                                            LocalizationManager.instance.t('journey_muhafiz'),
                                            style: GoogleFonts.cinzel(
                                              color: Color(0xFFA68255),
                                              fontSize: 10.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Opacity(
                                    opacity: valueOrDefault(
                                                currentUserDocument
                                                    ?.streakCount,
                                                0) >=
                                            30
                                        ? 1.0
                                        : 0.25,
                                    child: AuthUserStreamWidget(
                                      builder: (context) => Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Expanded(
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              child: Image.asset(
                                                'assets/images/STAGE_CELIK_MUHAFIZ.png',
                                                fit: BoxFit.contain,
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 6.0),
                                          Text(
                                            LocalizationManager.instance.t('journey_celik_muhafiz'),
                                            style: GoogleFonts.cinzel(
                                              color: Color(0xFFA68255),
                                              fontSize: 10.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Opacity(
                                    opacity: valueOrDefault(
                                                currentUserDocument
                                                    ?.streakCount,
                                                0) >=
                                            100
                                        ? 1.0
                                        : 0.25,
                                    child: AuthUserStreamWidget(
                                      builder: (context) => Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Expanded(
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              child: Image.asset(
                                                'assets/images/STAGE_SOVALYE.png',
                                                fit: BoxFit.contain,
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 6.0),
                                          Text(
                                            LocalizationManager.instance.t('journey_sovalye'),
                                            style: GoogleFonts.cinzel(
                                              color: Color(0xFFA68255),
                                              fontSize: 10.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Opacity(
                                    opacity: valueOrDefault(
                                                currentUserDocument
                                                    ?.streakCount,
                                                0) >=
                                            200
                                        ? 1.0
                                        : 0.25,
                                    child: AuthUserStreamWidget(
                                      builder: (context) => Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Expanded(
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              child: Image.asset(
                                                'assets/images/STAGE_KOMUTAN.png',
                                                fit: BoxFit.contain,
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 6.0),
                                          Text(
                                            LocalizationManager.instance.t('journey_komutan'),
                                            style: GoogleFonts.cinzel(
                                              color: Color(0xFFA68255),
                                              fontSize: 10.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Opacity(
                                    opacity: valueOrDefault(
                                                currentUserDocument
                                                    ?.streakCount,
                                                0) >=
                                            365
                                        ? 1.0
                                        : 0.25,
                                    child: AuthUserStreamWidget(
                                      builder: (context) => Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Expanded(
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              child: Image.asset(
                                                'assets/images/STAGE_KRAL.png',
                                                fit: BoxFit.contain,
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 6.0),
                                          Text(
                                            LocalizationManager.instance.t('journey_kral'),
                                            style: GoogleFonts.cinzel(
                                              color: Color(0xFFA68255),
                                              fontSize: 10.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, 1.0),
                      child: wrapWithModel(
                        model: _model.painToGainBottomNavModel,
                        updateCallback: () => safeSetState(() {}),
                        child: PainToGainBottomNavWidget(
                          activeTab: 3,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
          ),
        ),
      );
  }
}
