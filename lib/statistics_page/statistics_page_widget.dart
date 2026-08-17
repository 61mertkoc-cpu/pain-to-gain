import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/habit_logger.dart';
import '/components/pain_to_gain_bottom_nav_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'statistics_page_model.dart';
import '/backend/localization_manager.dart';
export 'statistics_page_model.dart';

class StatisticsPageWidget extends StatefulWidget {
  const StatisticsPageWidget({super.key});

  static String routeName = 'StatisticsPage';
  static String routePath = '/statisticsPage';

  @override
  State<StatisticsPageWidget> createState() => _StatisticsPageWidgetState();
}

class _StatisticsPageWidgetState extends State<StatisticsPageWidget> {
  String _getFormattedMonth(DateTime dt) {
    final monthsTr = ['OCAK', 'ŞUBAT', 'MART', 'NİSAN', 'MAYIS', 'HAZİRAN', 'TEMMUZ', 'AĞUSTOS', 'EYLÜL', 'EKİM', 'KASIM', 'ARALIK'];
    final monthsEn = ['JANUARY', 'FEBRUARY', 'MARCH', 'APRIL', 'MAY', 'JUNE', 'JULY', 'AUGUST', 'SEPTEMBER', 'OCTOBER', 'NOVEMBER', 'DECEMBER'];
    final idx = dt.month - 1;
    final isTr = LocalizationManager.instance.currentLocale == 'tr';
    final name = isTr ? monthsTr[idx] : monthsEn[idx];
    return '$name ${dt.year}';
  }

  late StatisticsPageModel _model;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StatisticsPageModel());
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
        backgroundColor: Colors.black,
        body: SafeArea(
          top: true,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            child: Stack(
              children: [
                // Background Image
                Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(0.0),
                    child: Image.asset(
                      'assets/images/hedefler.png',
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                // Semi-transparent overlay to ensure readability
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: Colors.black.withOpacity(0.4),
                ),
                // Main Content Scrollable View
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 12.0, 80.0),
                  child: StreamBuilder<UsersRecord>(
                    stream: UsersRecord.getDocument(currentUserReference!),
                    builder: (context, userSnapshot) {
                      if (!userSnapshot.hasData) {
                        return Center(
                          child: CircularProgressIndicator(
                            color: Color(0xFFA68255),
                          ),
                        );
                      }

                      final userRecord = userSnapshot.data!;
                      final rawHistory = userRecord.snapshotData['habit_history'] as List<dynamic>? ?? [];
                      final allLogs = HabitLogger.getParsedLogs(rawHistory);
                      final monthLogs = allLogs.where((log) {
                        return log.date.year == _model.selectedMonth.year &&
                            log.date.month == _model.selectedMonth.month;
                      }).toList();

                      return StreamBuilder<List<GoalsRecord>>(
                        stream: queryGoalsRecord(
                          queryBuilder: (q) => q.where('user_ref', isEqualTo: currentUserReference),
                        ),
                        builder: (context, goalsSnapshot) {
                          final goalsList = goalsSnapshot.data ?? [];
                          final goalTextMap = {for (var g in goalsList) g.reference.id: g.goalText};

                          // Calculations
                          int completedCount = 0;
                          int totalCount = 0;
                          int perfectDays = 0;

                          Map<String, int> goalCompletedCounts = {};
                          Map<String, int> goalTotalCounts = {};

                          for (var log in monthLogs) {
                            final completed = log.completed;
                            final total = log.total;

                            completedCount += completed.length;
                            totalCount += total.length;

                            if (total.isNotEmpty && completed.length == total.length) {
                              perfectDays++;
                            }

                            for (var gId in total) {
                              goalTotalCounts[gId] = (goalTotalCounts[gId] ?? 0) + 1;
                            }
                            for (var gId in completed) {
                              goalCompletedCounts[gId] = (goalCompletedCounts[gId] ?? 0) + 1;
                            }
                          }

                          int missedCount = totalCount - completedCount;
                          if (missedCount < 0) missedCount = 0;

                          int disciplineScore = 0;
                          if (totalCount > 0) {
                            disciplineScore = ((completedCount / totalCount) * 100).round();
                          }

                          return ListView(
                            padding: EdgeInsets.zero,
                            children: [
                              // Title "İSTATİSTİKLER"
                              Column(
                                children: [
                                  Text(
                                    LocalizationManager.instance.t('stats_title'),
                                    style: GoogleFonts.cinzel(
                                      color: Color(0xFFA68255),
                                      fontSize: 24.0,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 2.0,
                                    ),
                                  ),
                                  SizedBox(height: 4.0),
                                  // Diamond divider design
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(width: 40.0, height: 1.0, color: Color(0x66A68255)),
                                      SizedBox(width: 6.0),
                                      Transform.rotate(
                                        angle: 0.785, // 45 degrees
                                        child: Container(
                                          width: 6.0,
                                          height: 6.0,
                                          color: Color(0xFFA68255),
                                        ),
                                      ),
                                      SizedBox(width: 6.0),
                                      Container(width: 40.0, height: 1.0, color: Color(0x66A68255)),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 16.0),

                              // Month selector (with month switching arrows)
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        _model.selectedMonth = DateTime(_model.selectedMonth.year, _model.selectedMonth.month - 1, 1);
                                      });
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Icon(
                                        Icons.keyboard_arrow_left,
                                        color: Color(0xFFA68255),
                                        size: 24.0,
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () async {
                                      context.pushNamed('CalendarPage');
                                    },
                                    child: Container(
                                      width: 190.0,
                                      height: 42.0,
                                      decoration: BoxDecoration(
                                        color: Color(0xCC0A0A0A),
                                        borderRadius: BorderRadius.circular(6.0),
                                        border: Border.all(
                                          color: Color(0xFFA68255),
                                          width: 1.0,
                                        ),
                                      ),
                                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Icon(
                                            Icons.calendar_today_outlined,
                                            color: Color(0xFFA68255),
                                            size: 16.0,
                                          ),
                                          Text(
                                            _getFormattedMonth(_model.selectedMonth),
                                            style: GoogleFonts.inter(
                                              color: Color(0xFFF2EFE9),
                                              fontSize: 13.0,
                                              fontWeight: FontWeight.w600,
                                              letterSpacing: 0.5,
                                            ),
                                          ),
                                          Icon(
                                            Icons.keyboard_arrow_right,
                                            color: Color(0xFFA68255),
                                            size: 18.0,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        _model.selectedMonth = DateTime(_model.selectedMonth.year, _model.selectedMonth.month + 1, 1);
                                      });
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Icon(
                                        Icons.keyboard_arrow_right,
                                        color: Color(0xFFA68255),
                                        size: 24.0,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 16.0),

                              // Monthly Discipline Score Card
                              Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Color(0xCC050505),
                                  borderRadius: BorderRadius.circular(8.0),
                                  border: Border.all(
                                    color: Color(0xFFA68255),
                                    width: 1.0,
                                  ),
                                ),
                                padding: EdgeInsets.all(16.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          LocalizationManager.instance.t('stats_discipline'),
                                          style: GoogleFonts.inter(
                                            color: Color(0xFFA68255),
                                            fontSize: 11.0,
                                            fontWeight: FontWeight.w600,
                                            letterSpacing: 0.5,
                                          ),
                                        ),
                                        SizedBox(height: 6.0),
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.baseline,
                                          textBaseline: TextBaseline.alphabetic,
                                          children: [
                                            Text(
                                              '$disciplineScore',
                                              style: GoogleFonts.inter(
                                                color: Color(0xFFF2EFE9),
                                                fontSize: 48.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              ' /100',
                                              style: GoogleFonts.inter(
                                                color: Color(0x99F2EFE9),
                                                fontSize: 18.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.arrow_upward,
                                              color: Color(0xFF4CAF50),
                                              size: 16.0,
                                            ),
                                            SizedBox(width: 2.0),
                                            Text(
                                              '↑%9',
                                              style: GoogleFonts.inter(
                                                color: Color(0xFF4CAF50),
                                                fontSize: 14.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 4.0),
                                        Text(
                                          LocalizationManager.instance.t('stats_growth'),
                                          textAlign: TextAlign.end,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: GoogleFonts.inter(
                                            color: Color(0x88F2EFE9),
                                            fontSize: 10.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 12.0),

                              // Three Summary Cards Row
                              Row(
                                children: [
                                  // TAMAMLANAN
                                  Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Color(0xCC050505),
                                        borderRadius: BorderRadius.circular(8.0),
                                        border: Border.all(
                                          color: Color(0xFFA68255),
                                          width: 1.0,
                                        ),
                                      ),
                                      padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
                                      child: Column(
                                        children: [
                                          Text(
                                            LocalizationManager.instance.t('stats_completed'),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: GoogleFonts.inter(
                                              color: Color(0xFFA68255),
                                              fontSize: 9.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(height: 8.0),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Icon(Icons.flag, color: Color(0xFFA68255), size: 16.0),
                                              SizedBox(width: 6.0),
                                              Text(
                                                '$completedCount',
                                                style: GoogleFonts.inter(
                                                  color: Color(0xFFF2EFE9),
                                                  fontSize: 22.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 4.0),
                                          Text(
                                            LocalizationManager.instance.t('stats_unit_goal'),
                                            style: GoogleFonts.inter(
                                              color: Color(0x88F2EFE9),
                                              fontSize: 10.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 8.0),
                                  // KAÇIRILAN
                                  Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Color(0xCC050505),
                                        borderRadius: BorderRadius.circular(8.0),
                                        border: Border.all(
                                          color: Color(0xFFA68255),
                                          width: 1.0,
                                        ),
                                      ),
                                      padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
                                      child: Column(
                                        children: [
                                          Text(
                                            LocalizationManager.instance.t('stats_missed'),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: GoogleFonts.inter(
                                              color: Color(0xFFA68255),
                                              fontSize: 9.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(height: 8.0),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Icon(Icons.cancel_outlined, color: Color(0xFFA68255), size: 16.0),
                                              SizedBox(width: 6.0),
                                              Text(
                                                '$missedCount',
                                                style: GoogleFonts.inter(
                                                  color: Color(0xFFA68255),
                                                  fontSize: 22.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 4.0),
                                          Text(
                                            LocalizationManager.instance.t('stats_unit_goal'),
                                            style: GoogleFonts.inter(
                                              color: Color(0x88F2EFE9),
                                              fontSize: 10.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 8.0),
                                  // KUSURSUZ GÜN
                                  Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Color(0xCC050505),
                                        borderRadius: BorderRadius.circular(8.0),
                                        border: Border.all(
                                          color: Color(0xFFA68255),
                                          width: 1.0,
                                        ),
                                      ),
                                      padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
                                      child: Column(
                                        children: [
                                          Text(
                                            LocalizationManager.instance.t('stats_perfect'),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: GoogleFonts.inter(
                                              color: Color(0xFFA68255),
                                              fontSize: 9.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(height: 8.0),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Icon(Icons.wb_sunny_outlined, color: Color(0xFFA68255), size: 16.0),
                                              SizedBox(width: 6.0),
                                              Text(
                                                '$perfectDays',
                                                style: GoogleFonts.inter(
                                                  color: Color(0xFFF2EFE9),
                                                  fontSize: 22.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 4.0),
                                          Text(
                                            LocalizationManager.instance.t('stats_unit_day'),
                                            style: GoogleFonts.inter(
                                              color: Color(0x88F2EFE9),
                                              fontSize: 10.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 16.0),

                              // Hedef Performansları List Card
                              Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Color(0xCC050505),
                                  borderRadius: BorderRadius.circular(8.0),
                                  border: Border.all(
                                    color: Color(0xFFA68255),
                                    width: 1.0,
                                  ),
                                ),
                                padding: EdgeInsets.all(16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      LocalizationManager.instance.t('stats_performance'),
                                      style: GoogleFonts.inter(
                                        color: Color(0xFFA68255),
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 0.5,
                                      ),
                                    ),
                                    SizedBox(height: 12.0),
                                    // List of targets
                                    if (goalTotalCounts.isEmpty)
                                      Padding(
                                        padding: EdgeInsets.symmetric(vertical: 24.0),
                                        child: Center(
                                          child: Text(
                                            LocalizationManager.instance.t('stats_no_data'),
                                            style: GoogleFonts.inter(
                                              color: Color(0x88F2EFE9),
                                              fontSize: 12.0,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ...goalTotalCounts.entries.map((entry) {
                                      final gId = entry.key;
                                      final total = entry.value;
                                      final completed = goalCompletedCounts[gId] ?? 0;
                                      final missed = total - completed;
                                      final goalText = goalTextMap[gId] ?? LocalizationManager.instance.t('stats_deleted_goal');
                                      final percentage = total > 0 ? ((completed / total) * 100).round() : 0;

                                      return Padding(
                                        padding: EdgeInsets.symmetric(vertical: 8.0),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    goalText.toUpperCase(),
                                                    style: GoogleFonts.inter(
                                                      color: Color(0xFFF2EFE9),
                                                      fontSize: 				13.0,
                                                      fontWeight: FontWeight.w600,
                                                    ),
                                                  ),
                                                ),
                                                Text(
                                                  '%$percentage',
                                                  style: GoogleFonts.inter(
                                                    color: Color(0xFFA68255),
                                                    fontSize: 15.0,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                SizedBox(width: 16.0),
                                                Text(
                                                  '$completed/$total',
                                                  style: GoogleFonts.inter(
                                                    color: Color(0xCCF2EFE9),
                                                    fontSize: 12.0,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 6.0),
                                            // Progress Bar
                                            ClipRRect(
                                              borderRadius: BorderRadius.circular(4.0),
                                              child: Container(
                                                width: double.infinity,
                                                height: 8.0,
                                                color: Color(0xFF262626),
                                                child: FractionallySizedBox(
                                                  alignment: Alignment.centerLeft,
                                                  widthFactor: total > 0 ? (completed / total) : 0.0,
                                                  child: Container(
                                                    color: Color(0xFFA68255),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    }).toList(),
                                  ],
                                ),
                              ),
                              SizedBox(height: 24.0),

                              // Bottom Quote & Spartan icon
                              Column(
                                children: [
                                  Text(
                                    LocalizationManager.instance.t('stats_quote'),
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.inter(
                                      color: Color(0x66F2EFE9),
                                      fontStyle: FontStyle.italic,
                                      fontSize: 12.0,
                                    ),
                                  ),
                                  SizedBox(height: 8.0),
                                  Icon(
                                    Icons.shield_outlined,
                                    color: Color(0x33A68255),
                                    size: 24.0,
                                  ),
                                ],
                              ),
                              SizedBox(height: 24.0),
                            ],
                          );
                        },
                      );
                    },
                  ),
                ),
                // Bottom Navigation
                Align(
                  alignment: AlignmentDirectional(0.0, 1.0),
                  child: wrapWithModel(
                    model: _model.painToGainBottomNavModel,
                    updateCallback: () => safeSetState(() {}),
                    child: PainToGainBottomNavWidget(
                      activeTab: 2,
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
