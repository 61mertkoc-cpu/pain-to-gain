import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'dart:io' show Platform;
import '/index.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '/backend/localization_manager.dart';
import 'onboarding_page2_model.dart';
export 'onboarding_page2_model.dart';

class OnboardingPage2Widget extends StatefulWidget {
  const OnboardingPage2Widget({super.key});

  static String routeName = 'OnboardingPage2';
  static String routePath = '/onboardingPage2';

  @override
  State<OnboardingPage2Widget> createState() => _OnboardingPage2WidgetState();
}

class _OnboardingPage2WidgetState extends State<OnboardingPage2Widget> {
  late OnboardingPage2Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OnboardingPage2Model());
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
                      'assets/images/onboarding_bg_2.jpg',
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        color: Color(0x99000000),
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
                                    LocalizationManager.instance.t('onboarding1_title'),
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.cinzel(
                                      color: Color(0xFFA68255),
                                      fontSize: 32.0,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1.5,
                                      shadows: [
                                        Shadow(
                                          color: Colors.black,
                                          offset: Offset(0, 2),
                                          blurRadius: 4.0,
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 24.0),
                                  Text(
                                    LocalizationManager.instance.t('onboarding1_desc'),
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.inter(
                                      color: Color(0xFFF3F4F6),
                                      fontSize: 16.0,
                                      height: 1.5,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 32.0),
                            Column(
                              children: [
                                if (Platform.isAndroid)
                                  FFButtonWidget(
                                    onPressed: () async {
                                      GoRouter.of(context).prepareAuthEvent();
                                      final user = await authManager.signInWithGoogle(context);
                                      if (user == null) {
                                        return;
                                      }
                                      if (valueOrDefault<bool>(
                                              currentUserDocument?.onboardingCompleted, false) ==
                                          true) {
                                        context.goNamedAuth(
                                            HomePageWidget.routeName, context.mounted);
                                      } else {
                                        context.goNamedAuth(
                                            OnboardingPageWidget.routeName, context.mounted);
                                      }
                                    },
                                    text: LocalizationManager.instance.t('onboarding1_btn_google'),
                                    options: FFButtonOptions(
                                      width: double.infinity,
                                      height: 54.0,
                                      color: Color(0xFFA68255),
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
                                if (Platform.isIOS)
                                  FFButtonWidget(
                                    onPressed: () async {
                                      GoRouter.of(context).prepareAuthEvent();
                                      final user = await authManager.signInWithApple(context);
                                      if (user == null) {
                                        return;
                                      }
                                      if (valueOrDefault<bool>(
                                              currentUserDocument?.onboardingCompleted, false) ==
                                          true) {
                                        context.goNamedAuth(
                                            HomePageWidget.routeName, context.mounted);
                                      } else {
                                        context.goNamedAuth(
                                            OnboardingPageWidget.routeName, context.mounted);
                                      }
                                    },
                                    text: LocalizationManager.instance.t('onboarding1_btn_apple'),
                                    options: FFButtonOptions(
                                      width: double.infinity,
                                      height: 54.0,
                                      color: Color(0xFFA68255),
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
