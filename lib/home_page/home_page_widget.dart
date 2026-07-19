import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/pain_to_gain_bottom_nav_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:math' as math;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_page_model.dart';
import '/onboarding_page/onboarding_page_widget.dart';
import '/backend/habit_logger.dart';
import '/backend/localization_manager.dart';
import '/backend/quotes_repository.dart';
import '/backend/ad_manager.dart';
import '/backend/notification_service.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
export 'home_page_model.dart';

/// state
class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  static String routeName = 'HomePage';
  static String routePath = '/homePage';

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  BannerAd? _bannerAd;
  bool _isBannerAdLoaded = false;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());

    Future.delayed(Duration.zero, () async {
      if (currentUserReference != null) {
        await HabitLogger.checkAndResetDailyGoals(userRef: currentUserReference!);
      }
    });

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (currentUserDocument != null && 
          valueOrDefault<bool>(currentUserDocument?.onboardingCompleted, false) == false) {
        context.goNamed(OnboardingPageWidget.routeName);
        return;
      }

      final rnd = math.Random().nextInt(allQuotes.length);
      final q = allQuotes[rnd];
      final loc = LocalizationManager.instance.locale;
      
      _model.randomQuoteText = q.localizedText[loc] ?? q.localizedText['en'] ?? q.localizedText['tr']!;
      _model.randomQuoteAuthor = q.author;
      
      if (currentUserDocument != null && !kIsWeb) {
        NotificationService().scheduleStreakNotifications(currentUserDocument!);
      }
      
      safeSetState(() {});
    });

    /*
    if (!kIsWeb) {
      _bannerAd = AdManager.createBannerAd(
        onAdLoaded: (ad) {
          if (mounted) {
            setState(() {
              _isBannerAdLoaded = true;
            });
          }
        },
        onAdFailedToLoad: (ad, error) {
          ad.dispose();
          debugPrint('BannerAd failed to load: $error');
        },
      )..load();
    }
    */
  }

  @override
  void dispose() {
    _bannerAd?.dispose();
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
        backgroundColor: Colors.black,
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Builder(
                builder: (context) {
                  if (valueOrDefault(currentUserDocument?.streakCount, 0) <=
                      2) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        'assets/images/day_1.png',
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    );
                  } else if (valueOrDefault(
                          currentUserDocument?.streakCount, 0) <=
                      6) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        'assets/images/day_3.png',
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    );
                  } else if (valueOrDefault(
                          currentUserDocument?.streakCount, 0) <=
                      13) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        'assets/images/day_7.png',
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    );
                  } else if (valueOrDefault(
                          currentUserDocument?.streakCount, 0) <=
                      20) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        'assets/images/day_14.png',
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    );
                  } else if (valueOrDefault(
                          currentUserDocument?.streakCount, 0) <=
                      29) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        'assets/images/day_21.png',
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    );
                  } else if (valueOrDefault(
                          currentUserDocument?.streakCount, 0) <=
                      44) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        'assets/images/day_30.png',
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    );
                  } else if (valueOrDefault(
                          currentUserDocument?.streakCount, 0) <=
                      59) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        'assets/images/day_45.png',
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    );
                  } else if (valueOrDefault(
                          currentUserDocument?.streakCount, 0) <=
                      89) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        'assets/images/day_60.png',
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    );
                  } else if (valueOrDefault(
                          currentUserDocument?.streakCount, 0) <=
                      99) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        'assets/images/day_90.png',
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    );
                  } else if (valueOrDefault(
                          currentUserDocument?.streakCount, 0) <=
                      149) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        'assets/images/day_100.png',
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    );
                  } else if (valueOrDefault(
                          currentUserDocument?.streakCount, 0) <=
                      199) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        'assets/images/day_150.png',
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    );
                  } else if (valueOrDefault(
                          currentUserDocument?.streakCount, 0) <=
                      249) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        'assets/images/day_200.png',
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    );
                  } else if (valueOrDefault(
                          currentUserDocument?.streakCount, 0) <
                      299) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        'assets/images/day_250.png',
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    );
                  } else if (valueOrDefault(
                          currentUserDocument?.streakCount, 0) <=
                      364) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        'assets/images/day_300.png',
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    );
                  } else {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        'assets/images/KNG.png',
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    );
                  }
                },
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 12.0, 0.0),
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        width: double.infinity,
                        height: 90.0,
                        decoration: BoxDecoration(),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              flex: 3,
                              child: Container(
                                width: 100.0,
                                height: 100.0,
                                decoration: BoxDecoration(),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      LocalizationManager.instance.t('home_warrior'),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.inter(
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            color: Color(0xFFF7F8F7),
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                    AuthUserStreamWidget(
                                      builder: (context) => AutoSizeText(
                                        currentUserDisplayName,
                                        maxLines: 1,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.inter(
                                                fontWeight: FontWeight.bold,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              color: Color(0xFFF7F8F7),
                                              fontSize: 20.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.bold,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    ),
                                    AuthUserStreamWidget(
                                      builder: (context) => Text(
                                        () {
                                          final loc = LocalizationManager.instance;
                                          if (valueOrDefault(
                                                  currentUserDocument
                                                      ?.streakCount,
                                                  0) <=
                                              3) {
                                            return loc.t('journey_acemi');
                                          } else if (valueOrDefault(
                                                  currentUserDocument
                                                      ?.streakCount,
                                                  0) <=
                                              29) {
                                            return loc.t('journey_muhafiz');
                                          } else if (valueOrDefault(
                                                  currentUserDocument
                                                      ?.streakCount,
                                                  0) <=
                                              99) {
                                            return loc.t('journey_celik_muhafiz');
                                          } else if (valueOrDefault(
                                                  currentUserDocument
                                                      ?.streakCount,
                                                  0) <=
                                              199) {
                                            return loc.t('journey_sovalye');
                                          } else if (valueOrDefault(
                                                  currentUserDocument
                                                      ?.streakCount,
                                                  0) <=
                                              364) {
                                            return loc.t('journey_komutan');
                                          } else {
                                            return loc.t('journey_kral');
                                          }
                                        }(),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.inter(
                                                fontWeight: FontWeight.w600,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              color: Color(0xFFA68255),
                                              fontSize: 16.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    ),
                                    if (valueOrDefault(
                                            currentUserDocument?.streakCount,
                                            0) >=
                                        100)
                                      AuthUserStreamWidget(
                                        builder: (context) {
                                          final name = currentUserDocument?.companionName ?? '';
                                          if (name.isEmpty) return SizedBox.shrink();
                                          return Text(
                                            '${LocalizationManager.instance.t('home_companion_label')}: $name',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                  color: Color(0xFFD4AF37),
                                                  fontSize: 13.0,
                                                ),
                                          );
                                        },
                                      ),
                                  ].divide(SizedBox(height: 2.0)),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Container(
                                height: 100.0,
                                decoration: BoxDecoration(),
                                child: Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Container(
                                    width: double.infinity,
                                    height: 70.0,
                                    child: Stack(
                                      children: [
                                        Container(
                                          width: double.infinity,
                                          height: double.infinity,
                                          decoration: BoxDecoration(
                                            color: Color(0xCC050505),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            border: Border.all(
                                              color: Color(0xFFA68255),
                                              width: 1.0,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 0.0, 8.0, 0.0),
                                          child: Container(
                                            width: double.infinity,
                                            height: double.infinity,
                                            decoration: BoxDecoration(),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  child: Image.asset(
                                                    'assets/images/ate.png',
                                                    width: 30.0,
                                                    height: 80.0,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.center,
                                                    children: [
                                                      AuthUserStreamWidget(
                                                        builder: (context) =>
                                                            Text(
                                                          valueOrDefault<String>(
                                                            valueOrDefault(
                                                                    currentUserDocument
                                                                        ?.streakCount,
                                                                    0)
                                                                .toString(),
                                                            '0',
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                font: GoogleFonts
                                                                    .inter(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                color: Color(
                                                                    0xFFF7F8F7),
                                                                fontSize: 24.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontWeight,
                                                                fontStyle:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                              ),
                                                        ),
                                                      ),
                                                      Text(
                                                        LocalizationManager.instance.t('home_streak'),
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              font: GoogleFonts
                                                                  .inter(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontStyle:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                              ),
                                                              color: Color(
                                                                  0xFFA68255),
                                                              fontSize: 10.0,
                                                              letterSpacing: 0.0,
                                                              fontWeight:
                                                                  FontWeight.w600,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                            ),
                                                      ),
                                                    ].divide(
                                                        SizedBox(height: 4.0)),
                                                  ),
                                                ),
                                              ].divide(SizedBox(width: 6.0)),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ].divide(SizedBox(width: 8.0)),
                        ),
                      ),
                      if (valueOrDefault(
                              currentUserDocument?.streakCount, 0) >=
                          100)
                        AuthUserStreamWidget(
                          builder: (context) {
                            final name =
                                currentUserDocument?.companionName ?? '';
                            if (name.isNotEmpty) return SizedBox.shrink();
                            return Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 8.0, 0.0, 0.0),
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Color(0xCC050505),
                                  borderRadius: BorderRadius.circular(8.0),
                                  border: Border.all(
                                    color: Color(0xFFD4AF37),
                                    width: 1.0,
                                  ),
                                ),
                                padding: EdgeInsets.all(12.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.shield,
                                          color: Color(0xFFD4AF37),
                                          size: 20.0,
                                        ),
                                        SizedBox(width: 8.0),
                                        Expanded(
                                          child: Text(
                                            LocalizationManager.instance.t('home_companion_earned'),
                                            style: GoogleFonts.cinzel(
                                              color: Color(0xFFD4AF37),
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.bold,
                                              letterSpacing: 1.0,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 8.0),
                                    Text(
                                      LocalizationManager.instance.t('home_companion_earned_desc'),
                                      style: GoogleFonts.inter(
                                        color: Color(0xFFF2EFE9),
                                        fontSize: 12.0,
                                        height: 1.4,
                                      ),
                                    ),
                                    SizedBox(height: 12.0),
                                    FFButtonWidget(
                                      onPressed: () async {
                                        await showCompanionNamingDialog(
                                            context);
                                      },
                                      text: LocalizationManager.instance.t('home_companion_btn'),
                                      options: FFButtonOptions(
                                        width: double.infinity,
                                        height: 36.0,
                                        padding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: Color(0xFFD4AF37),
                                        textStyle: GoogleFonts.inter(
                                          color: Colors.black,
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        elevation: 2.0,
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(6.0),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                        child: Container(
                          width: double.infinity,
                          height: 110.0,
                          decoration: BoxDecoration(),
                          child: Container(
                            width: double.infinity,
                            height: 110.0,
                            child: Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image.asset(
                                    'assets/images/gunun_sozu_true_transparent.png',
                                    width: double.infinity,
                                    height: double.infinity,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      14.0, 10.0, 14.0, 8.0),
                                  child: Container(
                                    width: double.infinity,
                                    height: double.infinity,
                                    decoration: BoxDecoration(),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        Text(
                                          LocalizationManager.instance.translateQuote(_model.randomQuoteText),
                                          textAlign: TextAlign.start,
                                          maxLines: 2,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                font: GoogleFonts.inter(
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle: FontStyle.italic,
                                                ),
                                                color: Color(0xFFF2EFE9),
                                                fontSize: 20.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                                fontStyle: FontStyle.italic,
                                              ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12.0, 8.0, 12.0, 6.0),
                                          child: Text(
                                            _model.randomQuoteAuthor,
                                            textAlign: TextAlign.end,
                                            maxLines: 1,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight: FontWeight.w600,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  color: Color(0xFFA68255),
                                                  fontSize: 14.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                        ),
                                      ].divide(SizedBox(height: 2.0)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Spacer(),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(8.0, 1.0, 8.0, 1.0),
                        child: Container(
                          width: double.infinity,
                          height: 75.0,
                          decoration: BoxDecoration(),
                          child: Container(
                            width: double.infinity,
                            height: double.infinity,
                            child: Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image.asset(
                                    'assets/images/motivasyon_karti_true_transparent_wide.png',
                                    width: double.infinity,
                                    height: double.infinity,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        6.0, 3.0, 6.0, 3.0),
                                    child: AuthUserStreamWidget(
                                      builder: (context) => Text(
                                        () {
                                          final loc = LocalizationManager.instance;
                                          if (valueOrDefault(
                                                  currentUserDocument
                                                      ?.streakCount,
                                                  0) <=
                                              3) {
                                            return loc.t('home_mot_1');
                                          } else if (valueOrDefault(
                                                  currentUserDocument
                                                      ?.streakCount,
                                                  0) <=
                                              29) {
                                            return loc.t('home_mot_2');
                                          } else if (valueOrDefault(
                                                  currentUserDocument
                                                      ?.streakCount,
                                                  0) <=
                                              99) {
                                            return loc.t('home_mot_3');
                                          } else if (valueOrDefault(
                                                  currentUserDocument
                                                      ?.streakCount,
                                                  0) <=
                                              199) {
                                            return loc.t('home_mot_4');
                                          } else if (valueOrDefault(
                                                  currentUserDocument
                                                      ?.streakCount,
                                                  0) <=
                                              364) {
                                            return loc.t('home_mot_5');
                                          } else {
                                            return loc.t('home_mot_6');
                                          }
                                        }(),
                                        maxLines: 2,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.inter(
                                                fontWeight: FontWeight.w600,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              color: Color(0xFFA68255),
                                              fontSize: 15.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      wrapWithModel(
                        model: _model.painToGainBottomNavModel,
                        updateCallback: () => safeSetState(() {}),
                        child: PainToGainBottomNavWidget(
                          activeTab: 0,
                        ),
                      ),
                      if (_isBannerAdLoaded && _bannerAd != null && currentUserDocument?.isPremium != true)
                        Container(
                          width: double.infinity,
                          height: _bannerAd!.size.height.toDouble(),
                          alignment: Alignment.center,
                          child: Container(
                            width: _bannerAd!.size.width.toDouble(),
                            height: _bannerAd!.size.height.toDouble(),
                            child: AdWidget(ad: _bannerAd!),
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

  Future<void> showCompanionNamingDialog(BuildContext context) async {
    final loc = LocalizationManager.instance;
    final controller = TextEditingController();
    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
          child: AlertDialog(
            backgroundColor: Color(0xFF0D0D0D),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
              side: BorderSide(color: Color(0xFFA68255), width: 1.5),
            ),
            title: Text(
              loc.t('dialog_name_title'),
              textAlign: TextAlign.center,
              style: GoogleFonts.cinzel(
                color: Color(0xFFA68255),
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  loc.t('dialog_name_desc'),
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                    color: Color(0xFFF2EFE9),
                    fontSize: 12.0,
                    height: 1.4,
                  ),
                ),
                SizedBox(height: 16.0),
                Theme(
                  data: ThemeData(
                    textSelectionTheme: TextSelectionThemeData(
                      cursorColor: Color(0xFFA68255),
                    ),
                  ),
                  child: TextField(
                    controller: controller,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: loc.t('dialog_name_hint'),
                      hintStyle: TextStyle(color: Color(0x66F2EFE9)),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0x33A68255)),
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFFA68255)),
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                      filled: true,
                      fillColor: Color(0xCC050505),
                    ),
                  ),
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(dialogContext).pop();
                },
                child: Text(
                  loc.t('dialog_btn_cancel'),
                  style: GoogleFonts.inter(
                    color: Color(0x99F2EFE9),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  final name = controller.text.trim();
                  if (name.isNotEmpty) {
                    if (currentUserReference != null) {
                      await currentUserReference!.update({
                        'companion_name': name,
                      });
                    }
                    Navigator.of(dialogContext).pop();
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFA68255),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                ),
                child: Text(
                  loc.t('dialog_btn_save'),
                  style: GoogleFonts.inter(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
