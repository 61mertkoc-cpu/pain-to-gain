import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'dart:io' show Platform;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '/backend/localization_manager.dart';
import '/backend/audio_manager.dart';
import 'welcome_page_model.dart';
export 'welcome_page_model.dart';

class WelcomePageWidget extends StatefulWidget {
  const WelcomePageWidget({super.key});

  static String routeName = 'WelcomePage';
  static String routePath = '/welcomePage';

  @override
  State<WelcomePageWidget> createState() => _WelcomePageWidgetState();
}

class _WelcomePageWidgetState extends State<WelcomePageWidget> {
  late WelcomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WelcomePageModel());
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
        AudioManager.instance.startMusic();
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xFF0A0A0C),
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  'assets/images/welcome_bg.png',
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: MediaQuery.sizeOf(context).height * 1.0,
                  fit: BoxFit.cover,
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(20.0, 300.0, 20.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'PainToGain',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              font: GoogleFonts.inter(
                                fontWeight: FontWeight.w800,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                              color: Color(0xFFA68255),
                              fontSize: 32.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w800,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 20.0, 0.0, 40.0),
                        child: Text(
                          LocalizationManager.instance.t('welcome_subtitle'),
                          textAlign: TextAlign.center,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                            font: GoogleFonts.inter(
                              fontWeight: FontWeight.w600,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                            color: Color(0xFF9CA3AF),
                            fontSize: 14.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w600,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                            shadows: [
                              Shadow(
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                offset: Offset(2.0, 2.0),
                                blurRadius: 2.0,
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            if (Platform.isAndroid)
                              FFButtonWidget(
                                onPressed: () async {
                                  GoRouter.of(context).prepareAuthEvent();
                                  final user =
                                      await authManager.signInWithGoogle(context);
                                  if (user == null) {
                                    return;
                                  }
                                  if (valueOrDefault<bool>(
                                          currentUserDocument?.onboardingCompleted,
                                          false) ==
                                      true) {
                                    context.goNamedAuth(
                                        HomePageWidget.routeName, context.mounted);
                                  } else {
                                    context.goNamedAuth(
                                        OnboardingPageWidget.routeName,
                                        context.mounted);
                                  }
                                },
                                text: LocalizationManager.instance.t('btn_google_signin'),
                                options: FFButtonOptions(
                                  width: double.infinity,
                                  height: 44.0,
                                  color: Color(0xFFA68255),
                                  textStyle: GoogleFonts.inter(
                                    color: Colors.white,
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  elevation: 2.0,
                                  borderRadius: BorderRadius.circular(24.0),
                                ),
                              ),
                            SizedBox(height: 12.0),
                            if (Platform.isIOS)
                              FFButtonWidget(
                                onPressed: () async {
                                  GoRouter.of(context).prepareAuthEvent();
                                  final user =
                                      await authManager.signInWithApple(context);
                                  if (user == null) {
                                    return;
                                  }
                                  if (valueOrDefault<bool>(
                                          currentUserDocument?.onboardingCompleted,
                                          false) ==
                                      true) {
                                    context.goNamedAuth(
                                        HomePageWidget.routeName, context.mounted);
                                  } else {
                                    context.goNamedAuth(
                                        OnboardingPageWidget.routeName,
                                        context.mounted);
                                  }
                                },
                                text: LocalizationManager.instance.t('btn_apple_signin'),
                                options: FFButtonOptions(
                                  width: double.infinity,
                                  height: 44.0,
                                  color: Color(0xFF131314),
                                  textStyle: GoogleFonts.inter(
                                    color: Colors.white,
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  borderSide: BorderSide(
                                    color: Color(0xFFA68255),
                                    width: 1.0,
                                  ),
                                  elevation: 2.0,
                                  borderRadius: BorderRadius.circular(24.0),
                                ),
                              ),
                          ],
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
