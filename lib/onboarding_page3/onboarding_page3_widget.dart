import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '/backend/localization_manager.dart';
import 'onboarding_page3_model.dart';
export 'onboarding_page3_model.dart';

class OnboardingPage3Widget extends StatefulWidget {
  const OnboardingPage3Widget({super.key});

  static String routeName = 'OnboardingPage3';
  static String routePath = '/onboardingPage3';

  @override
  State<OnboardingPage3Widget> createState() => _OnboardingPage3WidgetState();
}

class _OnboardingPage3WidgetState extends State<OnboardingPage3Widget> {
  late OnboardingPage3Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OnboardingPage3Model());
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
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  width: double.infinity,
                  child: Stack(
                  children: [
                    Image.asset(
                      'assets/images/onboarding_bg_1.jpg',
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        color: Color(0xBB110000), // Dark reddish tint for finale
                      ),
                    ),
                    Positioned.fill(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 40.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
                              decoration: BoxDecoration(
                                color: Color(0xCC050505),
                                borderRadius: BorderRadius.circular(16.0),
                                border: Border.all(
                                  color: Color(0xFFA68255).withOpacity(0.5),
                                  width: 1.0,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.5),
                                    blurRadius: 10.0,
                                    offset: Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: Column(
                                children: [
                                  Text(
                                    LocalizationManager.instance.t('onboarding3_desc'),
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.cinzel(
                                      color: Color(0xFFD1D5DB),
                                      fontSize: 16.0,
                                      fontStyle: FontStyle.italic,
                                      height: 1.5,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 32.0),
                            Column(
                              children: [
                                FFButtonWidget(
                                  onPressed: () async {
                                    await currentUserReference!
                                        .update(createUsersRecordData(
                                      onboardingCompleted: true,
                                    ));

                                    context.goNamed(
                                      HomePageWidget.routeName,
                                      extra: <String, dynamic>{
                                        kTransitionInfoKey: TransitionInfo(
                                          hasTransition: true,
                                          transitionType: PageTransitionType.fade,
                                          duration: Duration(milliseconds: 600),
                                        ),
                                      },
                                    );
                                  },
                                  text: LocalizationManager.instance.t('onboarding3_btn'),
                                  options: FFButtonOptions(
                                    width: double.infinity,
                                    height: 54.0,
                                    color: Color(0xFF8B0000), // Dark red for accept
                                    textStyle: GoogleFonts.cinzel(
                                      color: Colors.white,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1.0,
                                    ),
                                    elevation: 4.0,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
