import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/habit_logger.dart';
import '/backend/localization_manager.dart';
import '/backend/audio_manager.dart';
import '/components/pain_to_gain_bottom_nav_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'settings_page_model.dart';
export 'settings_page_model.dart';

class SettingsPageWidget extends StatefulWidget {
  const SettingsPageWidget({super.key});

  static String routeName = 'SettingsPage';
  static String routePath = '/settingsPage';

  @override
  State<SettingsPageWidget> createState() => _SettingsPageWidgetState();
}

class _SettingsPageWidgetState extends State<SettingsPageWidget> {
  late SettingsPageModel _model;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SettingsPageModel());
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final loc = LocalizationManager.instance;

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
                  padding: EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 12.0, 80.0),
                  child: AuthUserStreamWidget(
                    builder: (context) {
                      final hasCompanion = valueOrDefault(currentUserDocument?.streakCount, 0) >= 100;
                      final companionName = currentUserDocument?.companionName ?? '';

                      return ListView(
                        padding: EdgeInsets.zero,
                        children: [
                          // Title "KRALLIK YÖNETİMİ"
                          Column(
                            children: [
                              Text(
                                loc.t('settings_title'),
                                style: GoogleFonts.cinzel(
                                  color: Color(0xFFA68255),
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 2.0,
                                ),
                              ),
                              SizedBox(height: 2.0),
                              Text(
                                loc.t('settings_subtitle'),
                                style: GoogleFonts.inter(
                                  color: Color(0x99F2EFE9),
                                  fontSize: 10.0,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 1.0,
                                ),
                              ),
                              SizedBox(height: 6.0),
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
                          SizedBox(height: 24.0),

                          // SECTION 1: SAVAŞÇI & YOLDAŞ (Profil Ayarları)
                          _buildSectionTitle(loc.t('settings_sec_profile')),
                          _buildSettingsContainer([
                            _buildSettingsItem(
                              icon: Icons.edit_outlined,
                              title: loc.t('settings_change_name'),
                              subtitle: currentUserDisplayName,
                              onTap: () => _showNameChangeDialog(context, isUser: true),
                            ),
                            _buildSettingsItem(
                              icon: Icons.pets_outlined,
                              title: loc.t('settings_change_companion'),
                              subtitle: !hasCompanion
                                  ? loc.t('settings_companion_locked')
                                  : (companionName.isEmpty ? loc.t('settings_companion_no_name') : companionName),
                              isEnabled: hasCompanion,
                              onTap: () => _showNameChangeDialog(context, isUser: false),
                            ),
                            _buildSettingsItem(
                              icon: Icons.exit_to_app,
                              title: loc.t('settings_sign_out'),
                              subtitle: loc.t('settings_sign_out_sub'),
                              textColor: Color(0xFFD9534F),
                              onTap: () => _showSignOutDialog(context),
                            ),
                          ]),
                          SizedBox(height: 20.0),

                          // SECTION 2: DEMİRCİ & MAĞAZA (Premium)
                          _buildSectionTitle(loc.t('settings_sec_shop')),
                          _buildSettingsContainer([
                            // Reklamları Kaldır Card (Golden Styled)
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 6.0),
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [Color(0x22D4AF37), Color(0x05D4AF37)],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                  borderRadius: BorderRadius.circular(6.0),
                                  border: Border.all(
                                    color: Color(0xFFD4AF37),
                                    width: 1.0,
                                  ),
                                ),
                                padding: EdgeInsets.all(12.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          loc.t('settings_remove_ads'),
                                          style: GoogleFonts.cinzel(
                                            color: Color(0xFFD4AF37),
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 0.5,
                                          ),
                                        ),
                                        SizedBox(height: 4.0),
                                        Text(
                                          loc.t('settings_remove_ads_sub'),
                                          style: GoogleFonts.inter(
                                            color: Color(0xCCF2EFE9),
                                            fontSize: 11.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                    FFButtonWidget(
                                      onPressed: () {
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          SnackBar(
                                            backgroundColor: Color(0xFF0F0F0F),
                                            content: Text(
                                              loc.t('snack_unlocked_soon'),
                                              style: TextStyle(color: Color(0xFFA68255)),
                                            ),
                                          ),
                                        );
                                      },
                                      text: loc.t('settings_buy_btn'),
                                      options: FFButtonOptions(
                                        width: 80.0,
                                        height: 32.0,
                                        color: Color(0xFFD4AF37),
                                        textStyle: GoogleFonts.inter(
                                          color: Colors.black,
                                          fontSize: 11.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        borderRadius: BorderRadius.circular(4.0),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            _buildSettingsItem(
                              icon: Icons.star_outline_rounded,
                              title: loc.t('settings_rate'),
                              subtitle: loc.t('settings_rate_sub'),
                              onTap: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    backgroundColor: Color(0xFF0F0F0F),
                                    content: Text(
                                      loc.t('snack_rate_thanks'),
                                      style: TextStyle(color: Color(0xFFA68255)),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ]),
                          SizedBox(height: 20.0),

                          // SECTION 3: PARŞÖMEN AYARLARI (Uygulama Ayarları)
                          _buildSectionTitle(loc.t('settings_sec_app')),
                          _buildSettingsContainer([
                            // Notifications Toggle Row
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.notifications_none, color: Color(0xFFA68255), size: 20.0),
                                      SizedBox(width: 12.0),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            loc.t('settings_notifications'),
                                            style: GoogleFonts.inter(
                                              color: Color(0xFFF2EFE9),
                                              fontSize: 13.0,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          Text(
                                            loc.t('settings_notifications_sub'),
                                            style: GoogleFonts.inter(
                                              color: Color(0x66F2EFE9),
                                              fontSize: 10.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Switch(
                                    value: _model.isNotificationsEnabled,
                                    onChanged: (val) {
                                      setState(() {
                                        _model.isNotificationsEnabled = val;
                                      });
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                          backgroundColor: Color(0xFF0F0F0F),
                                          content: Text(
                                            loc.t('snack_notif_updated'),
                                            style: TextStyle(color: Color(0xFFA68255)),
                                          ),
                                        ),
                                      );
                                    },
                                    activeColor: Color(0xFFA68255),
                                    activeTrackColor: Color(0x33A68255),
                                    inactiveThumbColor: Color(0xFF666666),
                                    inactiveTrackColor: Color(0xFF222222),
                                  ),
                                ],
                              ),
                            ),
                            // Background Music Toggle and Volume Slider Row
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 8.0),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                            AudioManager.instance.isMuted
                                                ? Icons.volume_off
                                                : Icons.volume_up,
                                            color: Color(0xFFA68255),
                                            size: 20.0,
                                          ),
                                          SizedBox(width: 12.0),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                loc.t('settings_bg_music'),
                                                style: GoogleFonts.inter(
                                                  color: Color(0xFFF2EFE9),
                                                  fontSize: 13.0,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              Text(
                                                loc.t('settings_bg_music_sub'),
                                                style: GoogleFonts.inter(
                                                  color: Color(0x66F2EFE9),
                                                  fontSize: 10.0,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Switch(
                                        value: !AudioManager.instance.isMuted,
                                        onChanged: (val) async {
                                          await AudioManager.instance.toggleMute();
                                          setState(() {});
                                        },
                                        activeColor: Color(0xFFA68255),
                                        activeTrackColor: Color(0x33A68255),
                                        inactiveThumbColor: Color(0xFF666666),
                                        inactiveTrackColor: Color(0xFF222222),
                                      ),
                                    ],
                                  ),
                                  if (!AudioManager.instance.isMuted)
                                    Padding(
                                      padding: EdgeInsets.only(left: 32.0, top: 4.0),
                                      child: Row(
                                        children: [
                                          Icon(Icons.volume_down, color: Color(0x66A68255), size: 16.0),
                                          Expanded(
                                            child: SliderTheme(
                                              data: SliderTheme.of(context).copyWith(
                                                activeTrackColor: Color(0xFFA68255),
                                                inactiveTrackColor: Color(0xFF222222),
                                                thumbColor: Color(0xFFA68255),
                                                overlayColor: Color(0x29A68255),
                                                trackHeight: 2.0,
                                              ),
                                              child: Slider(
                                                value: AudioManager.instance.volume,
                                                min: 0.0,
                                                max: 1.0,
                                                onChanged: (val) async {
                                                  await AudioManager.instance.setVolume(val);
                                                  setState(() {});
                                                },
                                              ),
                                            ),
                                          ),
                                          Icon(Icons.volume_up, color: Color(0x66A68255), size: 16.0),
                                        ],
                                      ),
                                    ),
                                ],
                              ),
                            ),
                            // Music Selector Row
                            InkWell(
                              onTap: () => _showMusicSelectDialog(context),
                              child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(Icons.music_note, color: Color(0xFFA68255), size: 20.0),
                                        SizedBox(width: 12.0),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              loc.t('settings_music_select'),
                                              style: GoogleFonts.inter(
                                                color: Color(0xFFF2EFE9),
                                                fontSize: 13.0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            Text(
                                              loc.t('settings_music_select_sub'),
                                              style: GoogleFonts.inter(
                                                color: Color(0x66F2EFE9),
                                                fontSize: 10.0,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Color(0x33000000),
                                        borderRadius: BorderRadius.circular(4.0),
                                        border: Border.all(color: Color(0x33A68255), width: 1.0),
                                      ),
                                      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
                                      child: Text(
                                        AudioManager.instance.availableTracks[AudioManager.instance.currentTrack] ?? 'Savaşçı',
                                        style: GoogleFonts.inter(
                                          color: Color(0xFFA68255),
                                          fontSize: 11.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            // Language Selector Row (Interactive)
                            InkWell(
                              onTap: () => _showLanguageSelectDialog(context),
                              child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(Icons.language, color: Color(0xFFA68255), size: 20.0),
                                        SizedBox(width: 12.0),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              loc.t('settings_lang'),
                                              style: GoogleFonts.inter(
                                                color: Color(0xFFF2EFE9),
                                                fontSize: 13.0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            Text(
                                              'Select your language',
                                              style: GoogleFonts.inter(
                                                color: Color(0x66F2EFE9),
                                                fontSize: 10.0,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Color(0x33000000),
                                        borderRadius: BorderRadius.circular(4.0),
                                        border: Border.all(color: Color(0x33A68255), width: 1.0),
                                      ),
                                      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
                                      child: Text(
                                        _getLanguageLabel(loc.locale),
                                        style: GoogleFonts.inter(
                                          color: Color(0xFFA68255),
                                          fontSize: 11.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            _buildSettingsItem(
                              icon: Icons.history,
                              title: loc.t('settings_reset'),
                              subtitle: loc.t('settings_reset_sub'),
                              textColor: Color(0xFFD9534F),
                              onTap: () => _showResetJourneyDialog(context),
                            ),
                          ]),
                          SizedBox(height: 24.0),
                        ],
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
                      activeTab: 4,
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

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(4.0, 10.0, 0.0, 6.0),
      child: Text(
        title,
        style: GoogleFonts.cinzel(
          color: Color(0xFFA68255),
          fontSize: 12.0,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.0,
        ),
      ),
    );
  }

  Widget _buildSettingsContainer(List<Widget> children) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xCC050505),
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          color: Color(0xFFA68255),
          width: 1.0,
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: 14.0, vertical: 8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: children,
      ),
    );
  }

  Widget _buildSettingsItem({
    required IconData icon,
    required String title,
    required String subtitle,
    Color? textColor,
    bool isEnabled = true,
    required VoidCallback onTap,
  }) {
    final color = isEnabled ? (textColor ?? Color(0xFFF2EFE9)) : Color(0xFF666666);
    final iconColor = isEnabled ? Color(0xFFA68255) : Color(0xFF444444);

    return InkWell(
      onTap: isEnabled ? onTap : null,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(icon, color: iconColor, size: 20.0),
                SizedBox(width: 12.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: GoogleFonts.inter(
                        color: color,
                        fontSize: 13.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 2.0),
                    Text(
                      subtitle,
                      style: GoogleFonts.inter(
                        color: isEnabled ? Color(0x66F2EFE9) : Color(0x33F2EFE9),
                        fontSize: 10.0,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Icon(
              Icons.keyboard_arrow_right,
              color: isEnabled ? Color(0x44A68255) : Color(0x11A68255),
              size: 20.0,
            ),
          ],
        ),
      ),
    );
  }

  String _getLanguageLabel(String locale) {
    switch (locale) {
      case 'tr':
        return 'TÜRKÇE 🇹🇷';
      case 'en':
        return 'ENGLISH 🇬🇧';
      case 'de':
        return 'DEUTSCH 🇩🇪';
      case 'es':
        return 'ESPAÑOL 🇪🇸';
      case 'fr':
        return 'FRANÇAIS 🇫🇷';
      default:
        return 'ENGLISH 🇬🇧';
    }
  }

  // Language Picker Dialog
  Future<void> _showLanguageSelectDialog(BuildContext context) async {
    final loc = LocalizationManager.instance;

    await showDialog(
      context: context,
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
              loc.t('settings_lang').toUpperCase(),
              textAlign: TextAlign.center,
              style: GoogleFonts.cinzel(
                color: Color(0xFFA68255),
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
            content: Container(
              width: double.maxFinite,
              child: ListView(
                shrinkWrap: true,
                children: [
                  _buildLanguageOption(dialogContext, 'tr', 'TÜRKÇE 🇹🇷'),
                  _buildLanguageOption(dialogContext, 'en', 'ENGLISH 🇬🇧'),
                  _buildLanguageOption(dialogContext, 'de', 'DEUTSCH 🇩🇪'),
                  _buildLanguageOption(dialogContext, 'es', 'ESPAÑOL 🇪🇸'),
                  _buildLanguageOption(dialogContext, 'fr', 'FRANÇAIS 🇫🇷'),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildLanguageOption(BuildContext dialogContext, String code, String label) {
    final isSelected = LocalizationManager.instance.locale == code;
    return InkWell(
      onTap: () async {
        Navigator.of(dialogContext).pop();
        await LocalizationManager.instance.setLocale(code);
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: GoogleFonts.inter(
                color: isSelected ? Color(0xFFD4AF37) : Color(0xFFF2EFE9),
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                fontSize: 14.0,
              ),
            ),
            if (isSelected)
              Icon(Icons.check, color: Color(0xFFD4AF37), size: 18.0),
          ],
        ),
      ),
    );
  }

  // Music Picker Dialog
  Future<void> _showMusicSelectDialog(BuildContext context) async {
    final loc = LocalizationManager.instance;
    await showDialog(
      context: context,
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
              loc.t('settings_music_title'),
              textAlign: TextAlign.center,
              style: GoogleFonts.cinzel(
                color: Color(0xFFA68255),
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
            content: Container(
              width: double.maxFinite,
              child: ListView(
                shrinkWrap: true,
                children: AudioManager.instance.availableTracks.entries.map((entry) {
                  return _buildMusicOption(dialogContext, entry.key, entry.value);
                }).toList(),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildMusicOption(BuildContext dialogContext, String path, String label) {
    final isSelected = AudioManager.instance.currentTrack == path;
    return InkWell(
      onTap: () async {
        Navigator.of(dialogContext).pop();
        await AudioManager.instance.changeTrack(path);
        setState(() {});
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                label,
                style: GoogleFonts.inter(
                  color: isSelected ? Color(0xFFD4AF37) : Color(0xFFF2EFE9),
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  fontSize: 13.0,
                ),
              ),
            ),
            if (isSelected)
              Icon(Icons.check, color: Color(0xFFD4AF37), size: 18.0),
          ],
        ),
      ),
    );
  }

  // Naming Modal Dialog
  Future<void> _showNameChangeDialog(BuildContext context, {required bool isUser}) async {
    final loc = LocalizationManager.instance;
    final controller = TextEditingController(
      text: isUser ? currentUserDisplayName : (currentUserDocument?.companionName ?? ''),
    );

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
              isUser ? loc.t('settings_dialog_rename_user') : loc.t('settings_dialog_rename_comp'),
              textAlign: TextAlign.center,
              style: GoogleFonts.cinzel(
                color: Color(0xFFA68255),
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  isUser
                      ? loc.t('settings_dialog_rename_user_desc')
                      : loc.t('settings_dialog_rename_comp_desc'),
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
                      hintText: isUser ? loc.t('settings_dialog_rename_user') : loc.t('settings_dialog_rename_comp'),
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
                  final text = controller.text.trim();
                  if (text.isNotEmpty) {
                    if (currentUserReference != null) {
                      if (isUser) {
                        await currentUserReference!.update({'display_name': text});
                      } else {
                        await currentUserReference!.update({'companion_name': text});
                      }
                    }
                    Navigator.of(dialogContext).pop();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Color(0xFF0F0F0F),
                        content: Text(
                          loc.t('snack_settings_updated'),
                          style: TextStyle(color: Color(0xFFA68255)),
                        ),
                      ),
                    );
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

  // Sign Out Dialog
  Future<void> _showSignOutDialog(BuildContext context) async {
    final loc = LocalizationManager.instance;

    await showDialog(
      context: context,
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
              loc.t('settings_dialog_sign_out_title'),
              textAlign: TextAlign.center,
              style: GoogleFonts.cinzel(
                color: Color(0xFFD9534F),
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
            content: Text(
              loc.t('settings_dialog_sign_out_desc'),
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                color: Color(0xFFF2EFE9),
                fontSize: 12.0,
                height: 1.4,
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(dialogContext).pop();
                },
                child: Text(
                  loc.t('settings_dialog_sign_out_btn_stay'),
                  style: GoogleFonts.inter(
                    color: Color(0x99F2EFE9),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  Navigator.of(dialogContext).pop();
                  await authManager.signOut();
                  context.goNamed('WelcomePage');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFD9534F),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                ),
                child: Text(
                  loc.t('settings_dialog_sign_out_btn_leave'),
                  style: GoogleFonts.inter(
                    color: Colors.white,
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

  // Reset Progress Dialog
  Future<void> _showResetJourneyDialog(BuildContext context) async {
    final loc = LocalizationManager.instance;

    await showDialog(
      context: context,
      builder: (dialogContext) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
          child: AlertDialog(
            backgroundColor: Color(0xFF0D0D0D),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
              side: BorderSide(color: Color(0xFFD9534F), width: 1.5),
            ),
            title: Text(
              loc.t('settings_dialog_reset_title'),
              textAlign: TextAlign.center,
              style: GoogleFonts.cinzel(
                color: Color(0xFFD9534F),
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
            content: Text(
              loc.t('settings_dialog_reset_desc'),
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                color: Color(0xFFF2EFE9),
                fontSize: 12.0,
                height: 1.4,
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(dialogContext).pop();
                },
                child: Text(
                  loc.t('settings_dialog_reset_btn_cancel'),
                  style: GoogleFonts.inter(
                    color: Color(0x99F2EFE9),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  Navigator.of(dialogContext).pop();
                  if (currentUserReference != null) {
                    final batch = FirebaseFirestore.instance.batch();

                    // 1. Delete all goals for the user
                    final goalsSnapshot = await FirebaseFirestore.instance
                        .collection('goals')
                        .where('user_ref', isEqualTo: currentUserReference)
                        .get();
                    for (var doc in goalsSnapshot.docs) {
                      batch.delete(doc.reference);
                    }

                    // 2. Reset user record stats
                    batch.update(currentUserReference!, {
                      'streak_count': 0,
                      'longest_streak': 0,
                      'total_completed_days': 0,
                      'last_completed_date': null,
                      'companion_name': '',
                      'habit_history': <String>[],
                    });

                    await batch.commit();

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Color(0xFF0F0F0F),
                        content: Text(
                          loc.t('snack_reset_success'),
                          style: TextStyle(color: Color(0xFFA68255)),
                        ),
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFD9534F),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                ),
                child: Text(
                  loc.t('settings_dialog_reset_btn_reset'),
                  style: GoogleFonts.inter(
                    color: Colors.white,
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
