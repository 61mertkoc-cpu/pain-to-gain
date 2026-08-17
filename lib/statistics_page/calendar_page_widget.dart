import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/habit_logger.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:collection/collection.dart';
import 'calendar_page_model.dart';
import '/backend/localization_manager.dart';
export 'calendar_page_model.dart';

class CalendarPageWidget extends StatefulWidget {
  const CalendarPageWidget({super.key});

  static String routeName = 'CalendarPage';
  static String routePath = '/calendarPage';

  @override
  State<CalendarPageWidget> createState() => _CalendarPageWidgetState();
}

class _CalendarPageWidgetState extends State<CalendarPageWidget> {
  String _getFormattedMonth(DateTime dt) {
    final monthsTr = ['OCAK', 'ŞUBAT', 'MART', 'NİSAN', 'MAYIS', 'HAZİRAN', 'TEMMUZ', 'AĞUSTOS', 'EYLÜL', 'EKİM', 'KASIM', 'ARALIK'];
    final monthsEn = ['JANUARY', 'FEBRUARY', 'MARCH', 'APRIL', 'MAY', 'JUNE', 'JULY', 'AUGUST', 'SEPTEMBER', 'OCTOBER', 'NOVEMBER', 'DECEMBER'];
    final idx = dt.month - 1;
    final isTr = LocalizationManager.instance.currentLocale == 'tr';
    final name = isTr ? monthsTr[idx] : monthsEn[idx];
    return '$name ${dt.year}';
  }

  late CalendarPageModel _model;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CalendarPageModel());
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
                  color: Colors.black.withOpacity(0.55),
                ),
                // Main Content Scrollable View
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 12.0, 24.0),
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
                              // Header section (Back Button + Title)
                              Stack(
                                alignment: Alignment.center,
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: InkWell(
                                      onTap: () async {
                                        context.goNamed('StatisticsPage');
                                      },
                                      child: Container(
                                        width: 38.0,
                                        height: 38.0,
                                        decoration: BoxDecoration(
                                          color: Color(0xCC050505),
                                          borderRadius: BorderRadius.circular(8.0),
                                          border: Border.all(
                                            color: Color(0xFFA68255),
                                            width: 1.0,
                                          ),
                                        ),
                                        child: Icon(
                                          Icons.keyboard_arrow_left,
                                          color: Color(0xFFA68255),
                                          size: 24.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    LocalizationManager.instance.t('stats_title'),
                                    style: GoogleFonts.cinzel(
                                      color: Color(0xFFA68255),
                                      fontSize: 22.0,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 2.0,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 12.0),

                              // Month selector with interactive arrows (< AĞUSTOS 2026 >)
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
                                      padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                                      child: Icon(
                                        Icons.keyboard_arrow_left,
                                        color: Color(0xFFA68255),
                                        size: 24.0,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 4.0),
                                  Icon(
                                    Icons.calendar_today_outlined,
                                    color: Color(0xFFA68255),
                                    size: 16.0,
                                  ),
                                  SizedBox(width: 6.0),
                                  Text(
                                    _getFormattedMonth(_model.selectedMonth),
                                    style: GoogleFonts.inter(
                                      color: Color(0xFFF2EFE9),
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 1.0,
                                    ),
                                  ),
                                  SizedBox(width: 4.0),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        _model.selectedMonth = DateTime(_model.selectedMonth.year, _model.selectedMonth.month + 1, 1);
                                      });
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
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

                              // Combined statistics card (AYLIK DİSİPLİN PUANI, TAMAMLANAN, KAÇIRILAN, KUSURSUZ GÜN)
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
                                padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
                                child: Row(
                                  children: [
                                    // AYLIK DİSİPLİN PUANI
                                    Expanded(
                                      child: Column(
                                        children: [
                                          Text(
                                            LocalizationManager.instance.t('cal_discipline_short'),
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.inter(
                                              color: Color(0xFFA68255),
                                              fontSize: 8.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(height: 4.0),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.baseline,
                                            textBaseline: TextBaseline.alphabetic,
                                            children: [
                                              Text(
                                                '$disciplineScore',
                                                style: GoogleFonts.inter(
                                                  color: Color(0xFFF2EFE9),
                                                  fontSize: 18.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Text(
                                                '/100',
                                                style: GoogleFonts.inter(
                                                  color: Color(0x99F2EFE9),
                                                  fontSize: 10.0,
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 6.0),
                                          // Small progress bar
                                          Container(
                                            width: 45.0,
                                            height: 3.0,
                                            color: Color(0xFF262626),
                                            child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: FractionallySizedBox(
                                                widthFactor: disciplineScore / 100.0,
                                                child: Container(color: Color(0xFFA68255)),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(width: 1.0, height: 40.0, color: Color(0x33A68255)),
                                    // TAMAMLANAN
                                    Expanded(
                                      child: Column(
                                        children: [
                                          Text(
                                            LocalizationManager.instance.t('stats_completed'),
                                            style: GoogleFonts.inter(
                                              color: Color(0xFFA68255),
                                              fontSize: 8.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(height: 6.0),
                                          Text(
                                            '$completedCount',
                                            style: GoogleFonts.inter(
                                              color: Color(0xFFF2EFE9),
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(height: 2.0),
                                          Text(
                                            LocalizationManager.instance.t('stats_unit_goal'),
                                            style: GoogleFonts.inter(
                                              color: Color(0x88F2EFE9),
                                              fontSize: 9.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(width: 1.0, height: 40.0, color: Color(0x33A68255)),
                                    // KAÇIRILAN
                                    Expanded(
                                      child: Column(
                                        children: [
                                          Text(
                                            LocalizationManager.instance.t('stats_missed'),
                                            style: GoogleFonts.inter(
                                              color: Color(0xFFA68255),
                                              fontSize: 8.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(height: 6.0),
                                          Text(
                                            '$missedCount',
                                            style: GoogleFonts.inter(
                                              color: Color(0xFFA68255),
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(height: 2.0),
                                          Text(
                                            LocalizationManager.instance.t('stats_unit_goal'),
                                            style: GoogleFonts.inter(
                                              color: Color(0x88F2EFE9),
                                              fontSize: 9.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(width: 1.0, height: 40.0, color: Color(0x33A68255)),
                                    // KUSURSUZ GÜN
                                    Expanded(
                                      child: Column(
                                        children: [
                                          Text(
                                            LocalizationManager.instance.t('stats_perfect'),
                                            style: GoogleFonts.inter(
                                              color: Color(0xFFA68255),
                                              fontSize: 8.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(height: 6.0),
                                          Text(
                                            '$perfectDays',
                                            style: GoogleFonts.inter(
                                              color: Color(0xFFF2EFE9),
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(height: 2.0),
                                          Text(
                                            LocalizationManager.instance.t('stats_unit_day'),
                                            style: GoogleFonts.inter(
                                              color: Color(0x88F2EFE9),
                                              fontSize: 9.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 16.0),

                              // Monthly Calendar Grid Container
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
                                padding: EdgeInsets.all(12.0),
                                child: Column(
                                  children: [
                                    // Days of Week Header
                                    GridView.count(
                                      crossAxisCount: 7,
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                       children: (LocalizationManager.instance.locale == 'tr'
                                           ? ['PZT', 'SAL', 'ÇAR', 'PER', 'CUM', 'CMT', 'PAZ']
                                           : ['MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT', 'SUN']).map((day) {
                                        return Center(
                                          child: Text(
                                            day,
                                            style: GoogleFonts.inter(
                                              color: Color(0x88F2EFE9),
                                              fontSize: 10.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        );
                                      }).toList(),
                                    ),
                                    SizedBox(height: 6.0),

                                    // Calendar Days Grid
                                    GridView.builder(
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 7,
                                        crossAxisSpacing: 4.0,
                                        mainAxisSpacing: 4.0,
                                      ),
                                      itemCount: 35,
                                      itemBuilder: (context, index) {
                                        int dayValue = 0;
                                        bool isCurrentMonth = false;
                                        bool isPastMonth = false;
                                        bool isNextMonth = false;

                                        if (index < 2) {
                                          isPastMonth = true;
                                          dayValue = index == 0 ? 29 : 30;
                                        } else if (index < 33) {
                                          isCurrentMonth = true;
                                          dayValue = index - 1;
                                        } else {
                                          isNextMonth = true;
                                          dayValue = index - 32;
                                        }

                                        if (isPastMonth) {
                                          return Container(
                                            decoration: BoxDecoration(
                                              color: Color(0x33222222),
                                              borderRadius: BorderRadius.circular(4.0),
                                            ),
                                            child: Center(
                                              child: Text(
                                                '$dayValue',
                                                style: TextStyle(color: Color(0x33F2EFE9), fontSize: 13.0),
                                              ),
                                            ),
                                          );
                                        }

                                        if (isNextMonth) {
                                          return Container(
                                            decoration: BoxDecoration(
                                              color: Color(0x33222222),
                                              borderRadius: BorderRadius.circular(4.0),
                                            ),
                                            child: Stack(
                                              alignment: Alignment.center,
                                              children: [
                                                Positioned(
                                                  top: 4.0,
                                                  right: 4.0,
                                                  child: Text(
                                                    '$dayValue',
                                                    style: TextStyle(color: Color(0x33F2EFE9), fontSize: 9.0),
                                                  ),
                                                ),
                                                Icon(
                                                  Icons.lock_outline_rounded,
                                                  color: Color(0x22F2EFE9),
                                                  size: 14.0,
                                                ),
                                              ],
                                            ),
                                          );
                                        }

                                        final targetDate = DateTime(2026, 7, dayValue);
                                        final dayLog = monthLogs.firstWhereOrNull((log) {
                                          final d = log.date;
                                          return d.year == targetDate.year &&
                                              d.month == targetDate.month &&
                                              d.day == targetDate.day;
                                        });

                                        Color cellColor = Colors.transparent;
                                        Border? cellBorder = Border.all(color: Color(0x1FA68255), width: 1.0);
                                        Color textColor = Color(0xBBF2EFE9);

                                        if (dayLog != null) {
                                          final completed = dayLog.completed;
                                          final total = dayLog.total;
                                          final pct = total.isNotEmpty ? (completed.length / total.length * 100).round() : 0;

                                          if (pct == 100) {
                                            cellColor = Color(0xFFA68255);
                                            textColor = Colors.black;
                                            cellBorder = null;
                                          } else if (pct >= 60) {
                                            cellColor = Color(0x88A68255);
                                            textColor = Colors.white;
                                            cellBorder = null;
                                          } else if (pct >= 30) {
                                            cellColor = Color(0xFF444444);
                                            textColor = Colors.white;
                                            cellBorder = null;
                                          } else {
                                            cellColor = Color(0xFF222222);
                                            textColor = Color(0xAAFFFFFF);
                                            cellBorder = null;
                                          }
                                        }

                                        return Container(
                                          decoration: BoxDecoration(
                                            color: cellColor,
                                            borderRadius: BorderRadius.circular(4.0),
                                            border: cellBorder,
                                          ),
                                          child: Center(
                                            child: Text(
                                              '$dayValue',
                                              style: GoogleFonts.inter(
                                                color: textColor,
                                                fontSize: 13.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                    SizedBox(height: 12.0),

                                    // Legend Row
                                    SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          _buildLegendItem(Color(0xFFA68255), '%100'),
                                          SizedBox(width: 8.0),
                                          _buildLegendItem(Color(0x88A68255), '%60-99'),
                                          SizedBox(width: 8.0),
                                          _buildLegendItem(Color(0xFF444444), '%30-59'),
                                          SizedBox(width: 8.0),
                                          _buildLegendItem(Color(0xFF222222), '%0-29'),
                                          SizedBox(width: 8.0),
                                          Row(
                                            children: [
                                              Container(
                                                width: 10.0,
                                                height: 10.0,
                                                decoration: BoxDecoration(
                                                  border: Border.all(color: Color(0x33A68255), width: 1.0),
                                                  borderRadius: BorderRadius.circular(2.0),
                                                ),
                                              ),
                                              SizedBox(width: 4.0),
                                              Text(
                                                'Veri yok',
                                                style: TextStyle(color: Color(0x88F2EFE9), fontSize: 9.0),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 16.0),

                              // Hedef Performansları list
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
                                      'HEDEF PERFORMANSLARI',
                                      style: GoogleFonts.inter(
                                        color: Color(0xFFA68255),
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 0.5,
                                      ),
                                    ),
                                    SizedBox(height: 12.0),
                                    if (goalTotalCounts.isEmpty)
                                      Padding(
                                        padding: EdgeInsets.symmetric(vertical: 24.0),
                                        child: Center(
                                          child: Text(
                                            'Bu ay henüz veri girişi yapılmamış.',
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
                                       final goalText = goalTextMap[gId] ?? LocalizationManager.instance.t('stats_deleted_goal');
                                      final percentage = total > 0 ? ((completed / total) * 100).round() : 0;

                                      return Padding(
                                        padding: EdgeInsets.symmetric(vertical: 8.0),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              flex: 3,
                                              child: Text(
                                                goalText.toUpperCase(),
                                                style: GoogleFonts.inter(
                                                  color: Color(0xFFF2EFE9),
                                                  fontSize: 12.0,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 5,
                                              child: Padding(
                                                padding: EdgeInsets.symmetric(horizontal: 8.0),
                                                child: ClipRRect(
                                                  borderRadius: BorderRadius.circular(3.0),
                                                  child: Container(
                                                    height: 6.0,
                                                    color: Color(0xFF262626),
                                                    child: Align(
                                                      alignment: Alignment.centerLeft,
                                                      child: FractionallySizedBox(
                                                        widthFactor: total > 0 ? (completed / total) : 0.0,
                                                        child: Container(
                                                          color: Color(0xFFA68255),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 2,
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.end,
                                                children: [
                                                  Text(
                                                    '$completed/31',
                                                    style: GoogleFonts.inter(
                                                      color: Color(0x88F2EFE9),
                                                      fontSize: 11.0,
                                                    ),
                                                  ),
                                                  SizedBox(width: 8.0),
                                                  Text(
                                                    '%$percentage',
                                                    style: GoogleFonts.inter(
                                                      color: Color(0xFFA68255),
                                                      fontSize: 12.0,
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                ],
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
                            ],
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLegendItem(Color color, String text) {
    return Row(
      children: [
        Container(
          width: 10.0,
          height: 10.0,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(2.0),
          ),
        ),
        SizedBox(width: 4.0),
        Text(
          text,
          style: TextStyle(color: Color(0x88F2EFE9), fontSize: 9.0),
        ),
      ],
    );
  }
}
