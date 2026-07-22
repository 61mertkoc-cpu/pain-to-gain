import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import '/index.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '/backend/localization_manager.dart';
import '/backend/habit_logger.dart';
import '/components/pain_to_gain_bottom_nav_widget.dart';
import 'goals_page_model.dart';
export 'goals_page_model.dart';

class GoalsPageWidget extends StatefulWidget {
  const GoalsPageWidget({super.key});

  static String routeName = 'GoalsPage';
  static String routePath = '/goalsPage';

  @override
  State<GoalsPageWidget> createState() => _GoalsPageWidgetState();
}

class _GoalsPageWidgetState extends State<GoalsPageWidget> {
  late GoalsPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GoalsPageModel());

    Future.delayed(Duration.zero, () async {
      if (currentUserReference != null) {
        await HabitLogger.checkAndResetDailyGoals(userRef: currentUserReference!);
      }
    });

    _model.textController1 ??= TextEditingController();
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textController2 ??= TextEditingController();
    _model.textFieldFocusNode2 ??= FocusNode();

    _model.switchValue = true;
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<GoalsRecord>>(
      stream: queryGoalsRecord(
        queryBuilder: (goalsRecord) => goalsRecord
            .where(
              'user_ref',
              isEqualTo: currentUserReference,
            )
            .where(
              'is_active',
              isEqualTo: true,
            ),
        limit: 6,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        List<GoalsRecord> goalsPageGoalsRecordList = List<GoalsRecord>.from(snapshot.data!);
        // Sort locally to avoid needing a Firestore composite index!
        goalsPageGoalsRecordList.sort((a, b) => a.sortOrder.compareTo(b.sortOrder));

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Stack(
              children: [
                // Background Image
                ClipRRect(
                  borderRadius: BorderRadius.circular(0.0),
                  child: Image.asset(
                    'assets/images/hedefler.png',
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                // Main Layout
                SafeArea(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Header Row (HEDEFLER + Count + Add Button)
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 10.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.6),
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(
                              color: Color(0x33A68255),
                              width: 1.0,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  LocalizationManager.instance.t('goals_title'),
                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                        font: GoogleFonts.cinzel(
                                          fontWeight: FontWeight.bold,
                                        ),
                                        color: Color(0xFFF4EBDD),
                                        fontSize: 22.0,
                                        letterSpacing: 1.5,
                                      ),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      '${goalsPageGoalsRecordList.where((e) => e.isCompleted).length}/${goalsPageGoalsRecordList.length}',
                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                            font: GoogleFonts.inter(),
                                            color: Color(0xFFF4EBDD),
                                            fontSize: 15.0,
                                          ),
                                    ),
                                    SizedBox(width: 16.0),
                                    InkWell(
                                      onTap: () {
                                        _model.selectedGoalRef = null;
                                        _model.textController1.text = '';
                                        _model.textController2.text = '';
                                        _model.selectedCategory = 'dumbbell';
                                        _model.showGoalEditor = true;
                                        safeSetState(() {});
                                      },
                                      child: Container(
                                        width: 32.0,
                                        height: 32.0,
                                        decoration: BoxDecoration(
                                          color: Color(0x33000000),
                                          border: Border.all(
                                            color: Color(0xFFA68255),
                                            width: 1.5,
                                          ),
                                          borderRadius: BorderRadius.circular(8.0),
                                        ),
                                        child: Center(
                                          child: Icon(
                                            Icons.add,
                                            color: Color(0xFFA68255),
                                            size: 18.0,
                                          ),
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
                      // Goals List
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.0),
                          child: goalsPageGoalsRecordList.isEmpty
                              ? Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.shield_outlined,
                                      color: Color(0x33A68255),
                                      size: 64.0,
                                    ),
                                    SizedBox(height: 12.0),
                                    Text(
                                      LocalizationManager.instance.t('goals_empty_state'),
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                            font: GoogleFonts.inter(),
                                            color: Color(0x88F4EBDD),
                                            fontSize: 14.0,
                                          ),
                                    ),
                                  ],
                                )
                              : ListView.separated(
                                  padding: EdgeInsets.only(top: 10.0, bottom: 90.0),
                                  itemCount: goalsPageGoalsRecordList.length + 1,
                                  separatorBuilder: (context, index) => SizedBox(height: 12.0),
                                  itemBuilder: (context, index) {
                                    if (index == goalsPageGoalsRecordList.length) {
                                      return _buildMotivationCard(context);
                                    }
                                    final goalItem = goalsPageGoalsRecordList[index];
                                    return _buildGoalCard(context, goalItem);
                                  },
                                ),
                        ),
                      ),
                    ],
                  ),
                ),
                // Bottom Navigation
                Align(
                  alignment: AlignmentDirectional(0.0, 1.0),
                  child: wrapWithModel(
                    model: _model.painToGainBottomNavModel,
                    updateCallback: () => safeSetState(() {}),
                    child: PainToGainBottomNavWidget(
                      activeTab: 1,
                    ),
                  ),
                ),
                // Combined Modal Overlay (Add & Edit modes)
                if (_model.showGoalEditor)
                  _buildGoalEditorModal(context, goalsPageGoalsRecordList),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildGoalCard(BuildContext context, GoalsRecord goalItem) {
    IconData categoryIcon;
    switch (goalItem.category) {
      case 'dumbbell':
        categoryIcon = Icons.fitness_center;
        break;
      case 'book':
        categoryIcon = Icons.menu_book;
        break;
      case 'heart':
        categoryIcon = Icons.favorite;
        break;
      case 'water_drop':
        categoryIcon = Icons.water_drop;
        break;
      case 'target':
        categoryIcon = Icons.track_changes;
        break;
      default:
        categoryIcon = Icons.keyboard_control;
    }

    return InkWell(
      onTap: () {
        _model.selectedGoalRef = goalItem.reference;
        _model.textController1.text = goalItem.goalText;
        _model.textController2.text = goalItem.description;
        _model.selectedCategory = goalItem.category.isEmpty ? 'dumbbell' : goalItem.category;
        _model.showGoalEditor = true;
        safeSetState(() {});
      },
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xE60D0D0D),
          border: Border.all(
            color: Color(0xFF332D24),
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  children: [
                    Container(
                      width: 40.0,
                      height: 40.0,
                      decoration: BoxDecoration(
                        color: Color(0x1A000000),
                        border: Border.all(
                          color: Color(0xFFA68255),
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Center(
                        child: Icon(
                          categoryIcon,
                          color: Color(0xFFA68255),
                          size: 20.0,
                        ),
                      ),
                    ),
                    SizedBox(width: 12.0),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            goalItem.goalText.toUpperCase(),
                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FontWeight.bold,
                                  ),
                                  color: Color(0xFFF4EBDD),
                                  fontSize: 14.0,
                                  letterSpacing: 0.5,
                                ),
                          ),
                          if (goalItem.description.isNotEmpty) ...[
                            SizedBox(height: 4.0),
                            Text(
                              goalItem.description,
                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.inter(),
                                    color: Color(0x99F4EBDD),
                                    fontSize: 11.0,
                                  ),
                            ),
                          ],
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 12.0),
              InkWell(
                onTap: () async {
                  await goalItem.reference.update(createGoalsRecordData(
                    isCompleted: !goalItem.isCompleted,
                  ));
                  if (currentUserReference != null) {
                    await HabitLogger.updateGoalLog(
                      userRef: currentUserReference!,
                      goalRef: goalItem.reference,
                      isCompleted: !goalItem.isCompleted,
                    );
                  }
                },
                child: goalItem.isCompleted
                    ? Container(
                        width: 32.0,
                        height: 32.0,
                        decoration: BoxDecoration(
                          color: Color(0x22107C41),
                          borderRadius: BorderRadius.circular(6.0),
                          border: Border.all(
                            color: Color(0xFF107C41),
                            width: 1.5,
                          ),
                        ),
                        child: Icon(
                          Icons.check,
                          color: Color(0xFF107C41),
                          size: 20.0,
                        ),
                      )
                    : Container(
                        width: 32.0,
                        height: 32.0,
                        decoration: BoxDecoration(
                          color: Color(0x22A80000),
                          borderRadius: BorderRadius.circular(6.0),
                          border: Border.all(
                            color: Color(0xFFA80000),
                            width: 1.5,
                          ),
                        ),
                        child: Icon(
                          Icons.close,
                          color: Color(0xFFA80000),
                          size: 18.0,
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMotivationCard(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0, bottom: 100.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0x1A80684C),
          border: Border.all(
            color: Color(0x66A68255),
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: EdgeInsets.all(12.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.info_outline,
                color: Color(0xFFA68255),
                size: 20.0,
              ),
              SizedBox(width: 10.0),
              Expanded(
                child: Text(
                  LocalizationManager.instance.t('goals_subtitle'),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        font: GoogleFonts.inter(),
                        color: Color(0xFFD4C5B9),
                        fontSize: 13.0,
                        lineHeight: 1.3,
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategorySelector(BuildContext context) {
    final categories = [
      {'name': 'dumbbell', 'icon': Icons.fitness_center},
      {'name': 'book', 'icon': Icons.menu_book},
      {'name': 'heart', 'icon': Icons.favorite},
      {'name': 'water_drop', 'icon': Icons.water_drop},
      {'name': 'target', 'icon': Icons.track_changes},
      {'name': 'other', 'icon': Icons.keyboard_control},
    ];

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: categories.map((cat) {
        final isSelected = _model.selectedCategory == cat['name'];
        return InkWell(
          onTap: () {
            _model.selectedCategory = cat['name'] as String;
            safeSetState(() {});
          },
          child: Container(
            width: 44.0,
            height: 44.0,
            decoration: BoxDecoration(
              color: isSelected ? Color(0x33A68255) : Color(0xFF0B0B0B),
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(
                color: isSelected ? Color(0xFFA68255) : Color(0xFF332D24),
                width: isSelected ? 2.0 : 1.0,
              ),
            ),
            child: Icon(
              cat['icon'] as IconData,
              color: isSelected ? Color(0xFFA68255) : Color(0xFF6E665C),
              size: 22.0,
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildGoalEditorModal(BuildContext context, List<GoalsRecord> activeGoals) {
    final isEditMode = _model.selectedGoalRef != null;

    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            _model.showGoalEditor = false;
            safeSetState(() {});
          },
          child: Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.black.withOpacity(0.75),
          ),
        ),
        Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Container(
              width: 340.0,
              decoration: BoxDecoration(
                color: Color(0xFF0F0F0F),
                border: Border.all(
                  color: Color(0xFF332D24),
                  width: 1.5,
                ),
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            isEditMode ? LocalizationManager.instance.t('goals_edit_title') : LocalizationManager.instance.t('goals_add_title'),
                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                  font: GoogleFonts.cinzel(
                                    fontWeight: FontWeight.bold,
                                  ),
                                  color: Color(0xFFF4EBDD),
                                  fontSize: 18.0,
                                  letterSpacing: 1.0,
                                ),
                          ),
                          IconButton(
                            icon: Icon(Icons.close, color: Color(0xFF6E665C)),
                            onPressed: () {
                              _model.showGoalEditor = false;
                              safeSetState(() {});
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: 16.0),
                      Text(
                        LocalizationManager.instance.t('goals_input_title'),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              font: GoogleFonts.inter(
                                fontWeight: FontWeight.bold,
                              ),
                              color: Color(0xFFA68255),
                              fontSize: 11.0,
                              letterSpacing: 1.0,
                            ),
                      ),
                      SizedBox(height: 8.0),
                      TextFormField(
                        controller: _model.textController1,
                        focusNode: _model.textFieldFocusNode1,
                        decoration: InputDecoration(
                          hintText: LocalizationManager.instance.t('goals_input_title_hint'),
                          hintStyle: TextStyle(color: Color(0xFF6E665C), fontSize: 13.0),
                          filled: true,
                          fillColor: Color(0xFF050505),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF332D24)),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFFA68255)),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        style: TextStyle(color: Color(0xFFF4EBDD), fontSize: 14.0),
                      ),
                      SizedBox(height: 16.0),
                      Text(
                        LocalizationManager.instance.t('goals_input_desc'),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              font: GoogleFonts.inter(
                                fontWeight: FontWeight.bold,
                              ),
                              color: Color(0xFFA68255),
                              fontSize: 11.0,
                              letterSpacing: 1.0,
                            ),
                      ),
                      SizedBox(height: 8.0),
                      TextFormField(
                        controller: _model.textController2,
                        focusNode: _model.textFieldFocusNode2,
                        maxLines: 3,
                        decoration: InputDecoration(
                          hintText: LocalizationManager.instance.t('goals_input_desc_hint'),
                          hintStyle: TextStyle(color: Color(0xFF6E665C), fontSize: 13.0),
                          filled: true,
                          fillColor: Color(0xFF050505),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF332D24)),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFFA68255)),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        style: TextStyle(color: Color(0xFFF4EBDD), fontSize: 14.0),
                      ),
                      SizedBox(height: 16.0),
                      Text(
                        LocalizationManager.instance.t('goals_input_category'),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              font: GoogleFonts.inter(
                                fontWeight: FontWeight.bold,
                              ),
                              color: Color(0xFFA68255),
                              fontSize: 11.0,
                              letterSpacing: 1.0,
                            ),
                      ),
                      SizedBox(height: 8.0),
                      _buildCategorySelector(context),
                      SizedBox(height: 16.0),
                      Text(
                        LocalizationManager.instance.t('goals_repeat_label'),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              font: GoogleFonts.inter(
                                fontWeight: FontWeight.bold,
                              ),
                              color: Color(0xFFA68255),
                              fontSize: 11.0,
                              letterSpacing: 1.0,
                            ),
                      ),
                      SizedBox(height: 8.0),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
                        decoration: BoxDecoration(
                          color: Color(0xFF050505),
                          border: Border.all(color: Color(0xFF332D24)),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(LocalizationManager.instance.t('goals_everyday_label'), style: TextStyle(color: Color(0xFFF4EBDD), fontSize: 14.0)),
                            Icon(Icons.keyboard_arrow_down, color: Color(0xFFA68255)),
                          ],
                        ),
                      ),
                      SizedBox(height: 24.0),
                      if (!isEditMode)
                        FFButtonWidget(
                          onPressed: () async {
                            if (_model.textController1.text.trim().isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(LocalizationManager.instance.t('snack_goal_empty'))),
                              );
                              return;
                            }
                            if (activeGoals.length >= 6) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  backgroundColor: Color(0xFF0D0D0D),
                                  content: Text(
                                    LocalizationManager.instance.t('goals_limit_warning'),
                                    style: TextStyle(color: Color(0xFFA68255)),
                                  ),
                                ),
                              );
                              return;
                            }
                            await GoalsRecord.collection.doc().set(createGoalsRecordData(
                              goalText: _model.textController1.text.trim(),
                              description: _model.textController2.text.trim(),
                              category: _model.selectedCategory,
                              userRef: currentUserReference,
                              isCompleted: false,
                              isActive: true,
                              sortOrder: activeGoals.length,
                              createdTime: getCurrentTimestamp,
                            ));
                            _model.showGoalEditor = false;
                            safeSetState(() {});
                          },
                          text: LocalizationManager.instance.t('dialog_btn_save'),
                          options: FFButtonOptions(
                            height: 44.0,
                            color: Color(0xFFA68255),
                            textStyle: TextStyle(
                              fontFamily: 'Inter',
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 14.0,
                            ),
                            elevation: 0.0,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        )
                      else
                        Row(
                          children: [
                            Expanded(
                              child: FFButtonWidget(
                                onPressed: () async {
                                  if (_model.textController1.text.trim().isEmpty) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text(LocalizationManager.instance.t('snack_goal_empty'))),
                                    );
                                    return;
                                  }
                                  await _model.selectedGoalRef!.update(createGoalsRecordData(
                                    goalText: _model.textController1.text.trim(),
                                    description: _model.textController2.text.trim(),
                                    category: _model.selectedCategory,
                                  ));
                                  _model.showGoalEditor = false;
                                  safeSetState(() {});
                                },
                                text: LocalizationManager.instance.t('goals_btn_update'),
                                options: FFButtonOptions(
                                  height: 44.0,
                                  color: Color(0xFFA68255),
                                  textStyle: TextStyle(
                                    fontFamily: 'Inter',
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14.0,
                                  ),
                                  elevation: 0.0,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ),
                            SizedBox(width: 12.0),
                            Expanded(
                              child: FFButtonWidget(
                                onPressed: () async {
                                  await _model.selectedGoalRef!.update(createGoalsRecordData(
                                    isActive: false,
                                  ));
                                  _model.showGoalEditor = false;
                                  safeSetState(() {});
                                },
                                text: LocalizationManager.instance.t('goals_btn_remove'),
                                options: FFButtonOptions(
                                  height: 44.0,
                                  color: Colors.transparent,
                                  textStyle: TextStyle(
                                    fontFamily: 'Inter',
                                    color: Color(0xFFA80000),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13.0,
                                  ),
                                  borderSide: BorderSide(
                                    color: Color(0xFFA80000),
                                    width: 1.5,
                                  ),
                                  elevation: 0.0,
                                  borderRadius: BorderRadius.circular(8.0),
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
          ),
        ),
      ],
    );
  }
}
