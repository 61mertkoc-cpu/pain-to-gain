import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:shared_preferences/shared_preferences.dart';

class LocalizationManager extends ChangeNotifier {
  LocalizationManager._privateConstructor();
  static final LocalizationManager instance = LocalizationManager._privateConstructor();

  String _locale = 'tr';
  String get locale => _locale;

  // Initialize language preference
  Future<void> init() async {
    final prefs = await SharedPreferences.getInstance();
    final savedLocale = prefs.getString('app_locale');
    if (savedLocale != null) {
      _locale = savedLocale;
    } else {
      // Auto-detect system language
      final sysLocale = PlatformDispatcher.instance.locale.languageCode.toLowerCase();
      if (['tr', 'en', 'de', 'es', 'fr', 'it', 'pt'].contains(sysLocale)) {
        _locale = sysLocale;
      } else {
        _locale = 'en'; // Default fallback
      }
    }
    notifyListeners();
  }

  // Change language and persist preference
  Future<void> setLocale(String newLocale) async {
    if (['tr', 'en', 'de', 'es', 'fr', 'it', 'pt'].contains(newLocale)) {
      _locale = newLocale;
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('app_locale', newLocale);
      notifyListeners();
    }
  }

  // Get translated string by key
  String t(String key) {
    return _translations[_locale]?[key] ?? _translations['en']?[key] ?? key;
  }

  // Translation dictionary
  static final Map<String, Map<String, String>> _translations = {
    'tr': {
      // Welcome Page
      'welcome_title': 'PainToGain',
      'welcome_subtitle': 'Yeni hayatına ilk adımı at\nKilit ekranı motivasyon ve günlük alışkanlık asistanın.',
      'welcome_start': 'Yeni Hayatına Giriş Yap',
      'btn_google_signin': 'Google ile Giriş Yap',
      'btn_apple_signin': 'Apple ile Giriş Yap',
      
      'onboarding1_title': 'Pain To Gain',
      'onboarding1_desc': 'Yeni hayatına ilk adımı at.',
      'onboarding1_btn_apple': 'Apple ile Giriş Yap',
      'onboarding1_btn_google': 'Google ile Giriş Yap',

      'onboarding2_title': 'SAVAŞA HAZIR MISIN?',
      'onboarding2_desc': 'Disiplin yoksa, zafer de yok. Motivasyon geçicidir, disiplin kalıcıdır.',
      'onboarding2_btn': 'DEVAM ET',

      'onboarding3_title': '',
      'onboarding3_desc': 'Bahaneleri bir kenara bırakacağıma ve her gün kendim için savaşıp en iyi halim olacağım.',
      'onboarding3_btn': 'YEMİN EDERİM',
      
      // Onboarding Pages
      'onboarding_title_1': 'MÜCADELENİ BELİRLE',
      'onboarding_desc_1': 'Disipline girmek istediğin hedeflerini seç veya kendin oluştur. Krallığının temelini bu hedefler atacak.',
      'onboarding_title_2': 'ASLA ZİNCİRİ KIRMA',
      'onboarding_desc_2': 'Her gün görevlerini tamamlayarak serini koru. Krallığın, disiplinin kadar büyüyecek.',
      'onboarding_btn_next': 'İLERLE',
      'onboarding_btn_back': 'GERİ',
      'onboarding_input_name': 'Savaşçı Adın Nedir?',
      'onboarding_input_name_hint': 'Adını gir, savaşçı...',

      // Nav Tabs
      'nav_home': 'Ana Sayfa',
      'nav_goals': 'Hedefler',
      'nav_stats': 'İstatistik',
      'nav_journey': 'Yolculuk',
      'nav_settings': 'Ayarlar',

      // Home Page
      'home_warrior': 'Savaşçı',
      'home_streak_label': 'MÜCADELE GÜNÜ',
      'home_streak': 'MÜCADELE',
      'home_quote_title': 'GÜNÜN SÖZÜ',
      'home_companion_earned': 'YOLDAŞ KAZANDIN!',
      'home_companion_earned_desc': 'Bundan sonra yalnız değilsin savaşçı. Bundan sonraki yolculuğun çok daha kolay olacak. Artık bir atın var!',
      'home_companion_btn': 'YOLDAŞINA İSİM VER',
      'home_companion_label': 'Sadık Yoldaş',
      'home_mot_1': 'İlk adımı attın. Şimdi geri dönmek yok.',
      'home_mot_2': 'Disiplinin şekilleniyor. Safını bozma.',
      'home_mot_3': 'Çelik iraden doğuyor. Baskıya boyun eğme.',
      'home_mot_4': 'Artık yolu sen açıyorsun. İlerlemeye devam et.',
      'home_mot_5': 'İraden emreder, zayıflığın susar.',
      'home_mot_6': 'Tahtını kazandın. Şimdi hükmünü sürdür.',

      // Naming Companion Dialog
      'dialog_name_title': 'YOLDAŞINI İSİMLENDİR',
      'dialog_name_desc': 'Sadık yoldaşın bu kutlu mücadelede seninle birlikte koşacak. Ona ne ad vermek istersin savaşçı?',
      'dialog_name_hint': 'Yoldaşının ismi...',
      'dialog_btn_save': 'KAYDET',
      'dialog_btn_cancel': 'İPTAL',

      // Goals Page
      'goals_title': 'HEDEFLER',
      'goals_limit_warning': 'Savaşçı, aynı anda en fazla 6 aktif hedefin olabilir! Gücünü bölme.',
      'goals_add_title': 'YENİ HEDEF',
      'goals_edit_title': 'HEDEFİ DÜZENLE',
      'goals_input_title': 'HEDEF ADI',
      'goals_input_title_hint': 'Hedefini yaz...',
      'goals_input_desc': 'AÇIKLAMA (İSTEĞE BAĞLI)',
      'goals_input_desc_hint': 'Açıklama eklemek istersen...',
      'goals_input_category': 'KATEGORİ (İSTEĞE BAĞLI)',
      'goals_repeat_label': 'TEKRARLAMA',
      'goals_everyday_label': 'Her gün',
      'goals_btn_add': 'YENİ HEDEF EKLE',
      'goals_btn_update': 'GÜNCELLE',
      'goals_btn_remove': 'HEDEFİ KALDIR',
      'goals_empty_state': 'Henüz bir savaş planın yok.\nYeni bir hedef ekleyerek mücadeleye başla!',
      'goals_subtitle': 'Hedeflerini her gün tamamla, serini koru ve yolculuğuna devam et.',
      'snack_goal_empty': 'Hedef adı boş bırakılamaz!',

      // Journey Page
      'journey_title': 'YOLCULUK',
      'journey_acemi': 'Level I - ACEMİ',
      'journey_muhafiz': 'Level II - MUHAFIZ',
      'journey_celik_muhafiz': 'Level III - ÇELİK MUHAFIZ',
      'journey_sovalye': 'Level IV - ŞÖVALYE',
      'journey_komutan': 'Level V - KOMUTAN',
      'journey_kral': 'Level VI - KRAL',
      'journey_acemi_desc': 'Krallığın ilk adımları. Henüz tecrübesiz bir savaşçısın. Disiplinini koru.',
      'journey_muhafiz_desc': 'Krallığın kapıları sana açılıyor. Serini koruyarak muhafız unvanını kazandın.',
      'journey_celik_desc': 'Artık zırhın daha çelikten. 21 gün boyunca pes etmedin ve gücünü kanıtladın.',
      'journey_sovalye_desc': '100 gündür yenilmezsin. Sadık bir yoldaş (at) edindin ve krallığın efsanesi oldun.',
      'journey_komutan_desc': '200 gündür orduları yönetiyorsun. Krallığın en güvenilir komutanlarından birisin.',
      'journey_kral_desc': '365 gün! Krallığın tahtı senin! En yüksek disipline ulaştın ve bir efsanesin.',

      // Statistics Page
      'stats_title': 'İSTATİSTİKLER',
      'stats_month_label': 'TEMMUZ 2026',
      'stats_discipline': 'AYLIK DİSİPLİN PUANI',
      'stats_completed': 'TAMAMLANAN',
      'stats_missed': 'KAÇIRILAN',
      'stats_perfect': 'KUSURSUZ GÜN',
      'stats_performance': 'HEDEF PERFORMANSLARI',
      'stats_no_data': 'Bu ay henüz veri girişi yapılmamış.',
      'stats_quote': 'Disiplin, özgürlüğün gerçek anahtarıdır.',
      'stats_unit_goal': 'hedef',
      'stats_unit_day': 'gün',
      'stats_growth': 'Geçen aya göre\ngelişim',
      'stats_deleted_goal': 'Silinmiş Hedef',

      // Calendar Page
      'cal_discipline_short': 'AYLIK DİSİPLİN',
      'cal_no_data': 'Veri yok',

      // Settings Page
      'settings_title': 'KRALLIK YÖNETİMİ',
      'settings_subtitle': 'SAVAŞÇI KONTROL PANELİ',
      'settings_sec_profile': 'SAVAŞÇI & YOLDAŞ',
      'settings_sec_shop': 'DEMİRCİ & MAĞAZA',
      'settings_sec_app': 'PARŞÖMEN AYARLARI',
      'settings_change_name': 'Savaşçı İsmini Değiştir',
      'settings_change_companion': 'Yoldaşının (Atının) İsmini Değiştir',
      'settings_companion_locked': 'Kilitli (100. Gün Gereklidir)',
      'settings_companion_no_name': 'İsim verilmemiş',
      'settings_sign_out': 'Krallıktan Ayrıl (Çıkış Yap)',
      'settings_sign_out_sub': 'Mücadelene geçici olarak ara ver',
      'settings_remove_ads': 'REKLAMLARI KALDIR',
      'settings_remove_ads_sub': 'Savaşırken dikkatin dağılmasın',
      'settings_buy_btn': 'SATIN AL',
      'settings_rate': 'Krallığa Puan Ver',
      'settings_rate_sub': 'Market mağazasında bizi derecelendir',
      'settings_notifications': 'Günlük Hatırlatıcılar',
      'settings_notifications_sub': 'Günü kaçırma, görevleri tamamla',
      'settings_lang': 'Dil Seçimi',
      'settings_bg_music': 'Arka Plan Müziği',
      'settings_bg_music_sub': 'Müziği açıp kapat veya sesi ayarla',
      'settings_music_select': 'Müzik Seçimi',
      'settings_music_select_sub': 'Arka plan müziğini değiştir',
      'settings_music_title': 'MÜZİK SEÇİMİ',
      'settings_reset': 'Yolculuğu Sıfırla (Yeniden Doğuş)',
      'settings_reset_sub': 'Tüm hedeflerini ve geçmişi silip baştan başla',
      'settings_dialog_rename_user': 'İSİM DEĞİŞTİR',
      'settings_dialog_rename_user_desc': 'Yeni savaşçı adını girerek kimliğini güncelle.',
      'settings_dialog_rename_comp': 'YOLDAŞ ADINI DEĞİŞTİR',
      'settings_dialog_rename_comp_desc': 'Sadık yoldaşına yeni bir ad bahşet.',
      'settings_dialog_sign_out_title': 'KRALLIKTAN AYRIL',
      'settings_dialog_sign_out_desc': 'Krallıktan ayrılmak istediğine emin misin savaşçı? Mücadelene ara verilecek.',
      'settings_dialog_sign_out_btn_stay': 'KAL',
      'settings_dialog_sign_out_btn_leave': 'AYRIL',
      'settings_dialog_reset_title': 'YENİDEN DOĞUŞ',
      'settings_dialog_reset_desc': 'Tüm hedefleriniz, serileriniz, yoldaşınız ve ilerlemeniz tamamen sıfırlanacak. Bu işlem geri alınamaz! Yeniden doğmak istiyor musun?',
      'settings_dialog_reset_btn_cancel': 'İPTAL',
      'settings_dialog_reset_btn_reset': 'SIFIRLA',

      // SnackBars & Notifications
      'snack_unlocked_soon': 'Demirci yakında yeni zırhlar dövecek! (Satın alım yakında)',
      'snack_rate_thanks': 'Krallığımıza desteğin için teşekkürler savaşçı!',
      'snack_settings_updated': 'Bilgilerin başarıyla güncellendi!',
      'snack_notif_updated': 'Bildirim ayarları güncellendi!',
      'snack_reset_success': 'Küllerinden yeniden doğdun savaşçı! Tüm ilerleme sıfırlandı.',
    },
    'en': {
      // Welcome Page
      'welcome_title': 'PainToGain',
      'welcome_subtitle': 'Take the first step to your new life\nLock screen motivation and daily habit assistant.',
      'welcome_start': 'Enter Your New Life',
      'btn_google_signin': 'Sign in with Google',
      'btn_apple_signin': 'Sign in with Apple',
      
      'onboarding1_title': 'Pain To Gain',
      'onboarding1_desc': 'Take the first step towards your new life.',
      'onboarding1_btn_apple': 'Sign in with Apple',
      'onboarding1_btn_google': 'Sign in with Google',

      'onboarding2_title': 'ARE YOU READY FOR BATTLE?',
      'onboarding2_desc': 'No discipline, no victory. Motivation is temporary, discipline is permanent.',
      'onboarding2_btn': 'CONTINUE',

      'onboarding3_title': '',
      'onboarding3_desc': 'I will put aside excuses and fight for myself every day to become my best version.',
      'onboarding3_btn': 'I SWEAR',
      
      // Onboarding Pages
      'onboarding_title_1': 'DEFINE YOUR STRUGGLE',
      'onboarding_desc_1': 'Choose your goals for discipline or create custom ones. These goals will lay the foundation of your kingdom.',
      'onboarding_title_2': 'NEVER BREAK THE CHAIN',
      'onboarding_desc_2': 'Keep your streak by completing your daily tasks. Your kingdom will grow as much as your discipline.',
      'onboarding_btn_next': 'NEXT',
      'onboarding_btn_back': 'BACK',
      'onboarding_input_name': 'What is Your Warrior Name?',
      'onboarding_input_name_hint': 'Enter your name, warrior...',

      // Nav Tabs
      'nav_home': 'Home',
      'nav_goals': 'Goals',
      'nav_stats': 'Stats',
      'nav_journey': 'Journey',
      'nav_settings': 'Settings',

      // Home Page
      'home_warrior': 'Warrior',
      'home_streak_label': 'STREAK DAY',
      'home_streak': 'STREAK',
      'home_quote_title': 'QUOTE OF THE DAY',
      'home_companion_earned': 'COMPANION UNLOCKED!',
      'home_companion_earned_desc': 'You are no longer alone, warrior. Your journey from now on will be much easier. You now have a horse!',
      'home_companion_btn': 'NAME YOUR COMPANION',
      'home_companion_label': 'Loyal Companion',
      'home_mot_1': 'You took the first step. There is no turning back now.',
      'home_mot_2': 'Your discipline is shaping. Do not break your ranks.',
      'home_mot_3': 'Your iron will is born. Do not bow to pressure.',
      'home_mot_4': 'You are clearing the way now. Keep moving forward.',
      'home_mot_5': 'Your will commands, your weakness stays silent.',
      'home_mot_6': 'You won your throne. Now rule over it.',

      // Naming Companion Dialog
      'dialog_name_title': 'NAME YOUR COMPANION',
      'dialog_name_desc': 'Your loyal companion will run with you in this sacred struggle. What would you like to name it, warrior?',
      'dialog_name_hint': 'Companion\'s name...',
      'dialog_btn_save': 'SAVE',
      'dialog_btn_cancel': 'CANCEL',

      // Goals Page
      'goals_title': 'GOALS',
      'goals_limit_warning': 'Warrior, you can set a maximum of 6 active goals at the same time! Do not divide your power.',
      'goals_add_title': 'NEW GOAL',
      'goals_edit_title': 'EDIT GOAL',
      'goals_input_title': 'GOAL NAME',
      'goals_input_title_hint': 'Enter your goal...',
      'goals_input_desc': 'DESCRIPTION (OPTIONAL)',
      'goals_input_desc_hint': 'Add a description if you want...',
      'goals_input_category': 'CATEGORY (OPTIONAL)',
      'goals_repeat_label': 'REPEAT',
      'goals_everyday_label': 'Every day',
      'goals_btn_add': 'ADD NEW GOAL',
      'goals_btn_update': 'UPDATE',
      'goals_btn_remove': 'REMOVE GOAL',
      'goals_empty_state': 'You don\'t have a battle plan yet.\nStart the struggle by adding a new goal!',
      'goals_subtitle': 'Complete your goals every day, maintain your streak, and continue your journey.',
      'snack_goal_empty': 'Goal name cannot be empty!',

      // Journey Page
      'journey_title': 'JOURNEY',
      'journey_acemi': 'Level I - NOVICE',
      'journey_muhafiz': 'Level II - GUARDIAN',
      'journey_celik_muhafiz': 'Level III - IRON GUARDIAN',
      'journey_sovalye': 'Level IV - KNIGHT',
      'journey_komutan': 'Level V - COMMANDER',
      'journey_kral': 'Level VI - KING',
      'journey_acemi_desc': 'First steps of the kingdom. You are still an inexperienced warrior. Maintain your discipline.',
      'journey_muhafiz_desc': 'The gates of the kingdom are opening to you. You earned the guardian title by keeping your streak.',
      'journey_celik_desc': 'Your armor is stronger now. You didn\'t give up for 21 days and proved your power.',
      'journey_sovalye_desc': 'You have been invincible for 100 days. You earned a loyal companion (horse) and became a legend.',
      'journey_komutan_desc': 'You have been commanding armies for 200 days. You are one of the most trusted commanders.',
      'journey_kral_desc': '365 days! The throne of the kingdom is yours! You reached the peak of discipline and are a legend.',

      // Statistics Page
      'stats_title': 'STATISTICS',
      'stats_month_label': 'JULY 2026',
      'stats_discipline': 'MONTHLY DISCIPLINE SCORE',
      'stats_completed': 'COMPLETED',
      'stats_missed': 'MISSED',
      'stats_perfect': 'PERFECT DAYS',
      'stats_performance': 'GOAL PERFORMANCE',
      'stats_no_data': 'No data logged for this month yet.',
      'stats_quote': 'Discipline is the ultimate key to freedom.',
      'stats_unit_goal': 'goals',
      'stats_unit_day': 'days',
      'stats_growth': 'Improvement from\nlast month',
      'stats_deleted_goal': 'Deleted Goal',

      // Calendar Page
      'cal_discipline_short': 'MONTHLY DISCIPLINE',
      'cal_no_data': 'No data',

      // Settings Page
      'settings_title': 'KINGDOM SETTINGS',
      'settings_subtitle': 'WARRIOR CONTROL PANEL',
      'settings_sec_profile': 'WARRIOR & COMPANION',
      'settings_sec_shop': 'BLACKSMITH & SHOP',
      'settings_sec_app': 'SCROLL SETTINGS',
      'settings_change_name': 'Change Warrior Name',
      'settings_change_companion': 'Change Companion Name',
      'settings_companion_locked': 'Locked (Day 100 Required)',
      'settings_companion_no_name': 'No name given',
      'settings_sign_out': 'Leave Kingdom (Log Out)',
      'settings_sign_out_sub': 'Temporarily pause your struggle',
      'settings_remove_ads': 'REMOVE ADS',
      'settings_remove_ads_sub': 'Do not get distracted while fighting',
      'settings_buy_btn': 'PURCHASE',
      'settings_rate': 'Rate Kingdom',
      'settings_rate_sub': 'Rate us on the market store',
      'settings_notifications': 'Daily Reminders',
      'settings_notifications_sub': 'Do not miss the day, complete tasks',
      'settings_lang': 'Language Selection',
      'settings_bg_music': 'Background Music',
      'settings_bg_music_sub': 'Turn music on/off or adjust volume',
      'settings_music_select': 'Music Selection',
      'settings_music_select_sub': 'Change the background music',
      'settings_music_title': 'MUSIC SELECTION',
      'settings_reset': 'Reset Journey (Rebirth)',
      'settings_reset_sub': 'Delete all goals and history and start over',
      'settings_dialog_rename_user': 'RENAME WARRIOR',
      'settings_dialog_rename_user_desc': 'Enter your new warrior name to update your identity.',
      'settings_dialog_rename_comp': 'RENAME COMPANION',
      'settings_dialog_rename_comp_desc': 'Bestow a new name upon your loyal companion.',
      'settings_dialog_sign_out_title': 'LEAVE KINGDOM',
      'settings_dialog_sign_out_desc': 'Are you sure you want to leave the kingdom, warrior? Your struggle will be paused.',
      'settings_dialog_sign_out_btn_stay': 'STAY',
      'settings_dialog_sign_out_btn_leave': 'LEAVE',
      'settings_dialog_reset_title': 'REBIRTH',
      'settings_dialog_reset_desc': 'All your goals, streaks, companion, and progress will be completely reset. This action cannot be undone! Do you want to be reborn?',
      'settings_dialog_reset_btn_cancel': 'CANCEL',
      'settings_dialog_reset_btn_reset': 'RESET',

      // SnackBars & Notifications
      'snack_unlocked_soon': 'The blacksmith will forge new armors soon! (Purchase coming soon)',
      'snack_rate_thanks': 'Thanks for supporting our kingdom, warrior!',
      'snack_settings_updated': 'Your settings have been updated successfully!',
      'snack_notif_updated': 'Notification settings updated!',
      'snack_reset_success': 'You have risen from your ashes, warrior! All progress has been reset.',
    },
    'de': {
      'welcome_title': 'PainToGain',
      'welcome_subtitle': 'Mache den ersten Schritt in dein neues Leben\nSperrbildschirm-Motivation und täglicher Gewohnheitsassistent.',
      'welcome_start': 'Dein neues Leben betreten',
      'btn_google_signin': 'Mit Google anmelden',
      'btn_apple_signin': 'Mit Apple anmelden',
      'onboarding1_title': 'BIST DU BEREIT FUER DEN KRIEG?',
      'onboarding1_box1_title': 'EID',
      'onboarding1_box1_desc': 'Sieg wird nicht an einem Tag errungen. Loyalitaet wird jeden Tag verdient.',
      'onboarding1_box2_title': 'EVOLUTION',
      'onboarding1_box2_desc': 'Mit zunehmender Loyalitaet entwickelst du dich ebenfalls weiter.',
      'onboarding1_box3_title': 'DAS GESETZ',
      'onboarding1_box3_desc': 'Ein Tag der Stille... setzt deine Loyalitaet zurueck.',
      'onboarding1_prompt': 'Schwoerst du, deinem Willen treu zu bleiben?',
      'onboarding1_btn': 'ICH SCHWOERE',
      'onboarding2_title': 'BIST DU BEREIT FUER DEN KRIEG?',
      'onboarding2_desc': 'DIE ENTSCHEIDUNGEN, DIE DU HEUTE TRIFFST,\nBESTIMMEN, WER DU MORGEN SEIN WIRST.',
      'onboarding2_btn': 'WEITER',
      'onboarding_title_1': 'DEFINIERE DEINEN KAMPF',
      'onboarding_desc_1': 'Waehle deine Disziplinziele oder erstelle eigene. Diese Ziele legen das Fundament deines Koenigreichs.',
      'onboarding_title_2': 'BRICH NIE DIE KETTE',
      'onboarding_desc_2': 'Halte deine Serie, indem du taeglich deine Aufgaben erledigst. Dein Koenigreich waechst so weit wie deine Disziplin.',
      'onboarding_btn_next': 'WEITER',
      'onboarding_btn_back': 'ZURUECK',
      'onboarding_input_name': 'Was ist dein Kriegername?',
      'onboarding_input_name_hint': 'Gib deinen Namen ein, Krieger...',
      'nav_home': 'Startseite',
      'nav_goals': 'Ziele',
      'nav_stats': 'Statistik',
      'nav_journey': 'Reise',
      'nav_settings': 'Einstellungen',
      'home_warrior': 'Krieger',
      'home_streak_label': 'SERIEN-TAG',
      'home_streak': 'SERIE',
      'home_quote_title': 'ZITAT DES TAGES',
      'home_companion_earned': 'BEGLEITER FREIGESCHALTET!',
      'home_companion_earned_desc': 'Du bist nicht mehr allein, Krieger. Deine Reise wird einfacher. Du hast jetzt ein Pferd!',
      'home_companion_btn': 'BEGLEITER BENENNEN',
      'home_companion_label': 'Treuer Begleiter',
      'home_mot_1': 'Du hast den ersten Schritt gemacht. Es gibt kein Zurueck mehr.',
      'home_mot_2': 'Deine Disziplin formt sich. Breche deine Reihen nicht.',
      'home_mot_3': 'Dein eiserner Wille entsteht. Beuge dich nicht dem Druck.',
      'home_mot_4': 'Du bahnst dir jetzt den Weg. Gehe weiter vorwaerts.',
      'home_mot_5': 'Dein Wille befiehlt, deine Schwaeche schweigt.',
      'home_mot_6': 'Du hast deinen Thron gewonnen. Herrsche nun darueber.',
      'dialog_name_title': 'BEGLEITER BENENNEN',
      'dialog_name_desc': 'Dein treuer Begleiter wird diesen heiligen Kampf mit dir laufen. Wie moechtest du ihn nennen, Krieger?',
      'dialog_name_hint': 'Name des Begleiters...',
      'dialog_btn_save': 'SPEICHERN',
      'dialog_btn_cancel': 'ABBRECHEN',
      'goals_title': 'ZIELE',
      'goals_limit_warning': 'Krieger, du kannst gleichzeitig maximal 6 aktive Ziele haben! Teile deine Kraft nicht.',
      'goals_add_title': 'NEUES ZIEL',
      'goals_edit_title': 'ZIEL BEARBEITEN',
      'goals_input_title': 'ZIELNAME',
      'goals_input_title_hint': 'Gib dein Ziel ein...',
      'goals_input_desc': 'BESCHREIBUNG (OPTIONAL)',
      'goals_input_desc_hint': 'Fuege eine Beschreibung hinzu, wenn du moechtest...',
      'goals_input_category': 'KATEGORIE (OPTIONAL)',
      'goals_repeat_label': 'WIEDERHOLUNG',
      'goals_everyday_label': 'Jeden Tag',
      'goals_btn_add': 'NEUES ZIEL HINZUFUEGEN',
      'goals_btn_update': 'AKTUALISIEREN',
      'goals_btn_remove': 'ZIEL ENTFERNEN',
      'goals_empty_state': 'Du hast noch keinen Schlachtplan.\nBeginne den Kampf, indem du ein neues Ziel hinzufuegst!',
      'goals_subtitle': 'Erledige deine Ziele jeden Tag, halte deine Serie und setze deine Reise fort.',
      'snack_goal_empty': 'Zielname darf nicht leer sein!',
      'journey_title': 'REISE',
      'journey_acemi': 'Level I - ANFAENGER',
      'journey_muhafiz': 'Level II - WAECHTER',
      'journey_celik_muhafiz': 'Level III - EISENWAECHTER',
      'journey_sovalye': 'Level IV - RITTER',
      'journey_komutan': 'Level V - KOMMANDANT',
      'journey_kral': 'Level VI - KOENIG',
      'journey_acemi_desc': 'Erste Schritte des Koenigreichs. Du bist noch ein unerfahrener Krieger. Bewahre deine Disziplin.',
      'journey_muhafiz_desc': 'Die Tore des Koenigreichs oeffnen sich fuer dich. Du hast den Waechtertitel verdient.',
      'journey_celik_desc': 'Deine Ruestung ist jetzt staerker. Du hast 21 Tage nicht aufgegeben.',
      'journey_sovalye_desc': 'Du bist seit 100 Tagen unbesiegbar. Du hast einen treuen Begleiter gewonnen.',
      'journey_komutan_desc': 'Du befehligst seit 200 Tagen Armeen. Du bist einer der vertrauenswuerdigsten Kommandanten.',
      'journey_kral_desc': '365 Tage! Der Thron gehoert dir! Du hast den Gipfel der Disziplin erreicht.',
      'stats_title': 'STATISTIKEN',
      'stats_month_label': 'JULI 2026',
      'stats_discipline': 'MONATLICHER DISZIPLIN-SCORE',
      'stats_completed': 'ABGESCHLOSSEN',
      'stats_missed': 'VERPASST',
      'stats_perfect': 'PERFEKTE TAGE',
      'stats_performance': 'ZIELLEISTUNG',
      'stats_no_data': 'Noch keine Daten fuer diesen Monat erfasst.',
      'stats_quote': 'Disziplin ist der wahre Schluessel zur Freiheit.',
      'stats_unit_goal': 'Ziele',
      'stats_unit_day': 'Tage',
      'stats_growth': 'Verbesserung gegenueber\ndem Vormonat',
      'stats_deleted_goal': 'Geloeschtes Ziel',
      'cal_discipline_short': 'MONATL. DISZIPLIN',
      'cal_no_data': 'Keine Daten',
      'settings_title': 'KOENIGREICH-VERWALTUNG',
      'settings_subtitle': 'KRIEGER KONTROLLPANEL',
      'settings_sec_profile': 'KRIEGER & BEGLEITER',
      'settings_sec_shop': 'SCHMIED & LADEN',
      'settings_sec_app': 'SCHRIFTROLLE EINSTELLUNGEN',
      'settings_change_name': 'Kriegername aendern',
      'settings_change_companion': 'Begleitername aendern',
      'settings_companion_locked': 'Gesperrt (Tag 100 erforderlich)',
      'settings_companion_no_name': 'Kein Name vergeben',
      'settings_sign_out': 'Koenigreich verlassen (Abmelden)',
      'settings_sign_out_sub': 'Deinen Kampf voruebergehend pausieren',
      'settings_remove_ads': 'WERBUNG ENTFERNEN',
      'settings_remove_ads_sub': 'Lass dich beim Kaempfen nicht ablenken',
      'settings_buy_btn': 'KAUFEN',
      'settings_rate': 'Koenigreich bewerten',
      'settings_rate_sub': 'Bewerte uns im Marktplatz',
      'settings_notifications': 'Taegliche Erinnerungen',
      'settings_notifications_sub': 'Verpasse nicht den Tag, erledige Aufgaben',
      'settings_lang': 'Sprachauswahl',
      'settings_bg_music': 'Hintergrundmusik',
      'settings_bg_music_sub': 'Musik ein-/ausschalten oder Lautstaerke anpassen',
      'settings_music_select': 'Musikauswahl',
      'settings_music_select_sub': 'Hintergrundmusik aendern',
      'settings_music_title': 'MUSIKAUSWAHL',
      'settings_reset': 'Reise zuruecksetzen (Wiedergeburt)',
      'settings_reset_sub': 'Alle Ziele und den Verlauf loeschen und neu beginnen',
      'settings_dialog_rename_user': 'KRIEGER UMBENENNEN',
      'settings_dialog_rename_user_desc': 'Gib deinen neuen Kriegernamen ein.',
      'settings_dialog_rename_comp': 'BEGLEITER UMBENENNEN',
      'settings_dialog_rename_comp_desc': 'Verleihe deinem treuen Begleiter einen neuen Namen.',
      'settings_dialog_sign_out_title': 'KOENIGREICH VERLASSEN',
      'settings_dialog_sign_out_desc': 'Bist du sicher, dass du das Koenigreich verlassen willst, Krieger?',
      'settings_dialog_sign_out_btn_stay': 'BLEIBEN',
      'settings_dialog_sign_out_btn_leave': 'VERLASSEN',
      'settings_dialog_reset_title': 'WIEDERGEBURT',
      'settings_dialog_reset_desc': 'Alle deine Ziele, Serien und dein Fortschritt werden zurueckgesetzt. Diese Aktion kann nicht rueckgaengig gemacht werden!',
      'settings_dialog_reset_btn_cancel': 'ABBRECHEN',
      'settings_dialog_reset_btn_reset': 'ZURUECKSETZEN',
      'snack_unlocked_soon': 'Der Schmied wird bald neue Ruestungen schmieden!',
      'snack_rate_thanks': 'Danke fuer deine Unterstuetzung, Krieger!',
      'snack_settings_updated': 'Deine Einstellungen wurden erfolgreich aktualisiert!',
      'snack_notif_updated': 'Benachrichtigungseinstellungen aktualisiert!',
      'snack_reset_success': 'Du bist aus deiner Asche wiedergeboren, Krieger!',
    },
    'es': {
      'welcome_title': 'PainToGain',
      'welcome_subtitle': 'Da el primer paso hacia tu nueva vida\nMotivacion de pantalla de bloqueo y asistente de habitos diarios.',
      'welcome_start': 'Entrar a Tu Nueva Vida',
      'btn_google_signin': 'Iniciar sesion con Google',
      'btn_apple_signin': 'Iniciar sesion con Apple',
      'onboarding1_title': 'ESTAS LISTO PARA LA GUERRA?',
      'onboarding1_box1_title': 'JURAMENTO',
      'onboarding1_box1_desc': 'La victoria no se gana en un dia. La lealtad se gana cada dia.',
      'onboarding1_box2_title': 'EVOLUCION',
      'onboarding1_box2_desc': 'A medida que aumenta tu lealtad, tu tambien evolucionas.',
      'onboarding1_box3_title': 'LA LEY',
      'onboarding1_box3_desc': 'Un dia de silencio... restablece tu lealtad.',
      'onboarding1_prompt': 'Juras permanecer leal a tu voluntad?',
      'onboarding1_btn': 'LO JURO',
      'onboarding2_title': 'ESTAS LISTO PARA LA GUERRA?',
      'onboarding2_desc': 'LAS DECISIONES QUE TOMES HOY,\nDETERMINARAN QUIEN SERAS MANANA.',
      'onboarding2_btn': 'CONTINUAR',
      'onboarding_title_1': 'DEFINE TU LUCHA',
      'onboarding_desc_1': 'Elige tus objetivos de disciplina o crea los tuyos. Estos objetivos estableceran los cimientos de tu reino.',
      'onboarding_title_2': 'NUNCA ROMPER LA CADENA',
      'onboarding_desc_2': 'Manten tu racha completando tus tareas diarias. Tu reino crecera tanto como tu disciplina.',
      'onboarding_btn_next': 'SIGUIENTE',
      'onboarding_btn_back': 'ATRAS',
      'onboarding_input_name': 'Cual es Tu Nombre de Guerrero?',
      'onboarding_input_name_hint': 'Ingresa tu nombre, guerrero...',
      'nav_home': 'Inicio',
      'nav_goals': 'Objetivos',
      'nav_stats': 'Estadisticas',
      'nav_journey': 'Viaje',
      'nav_settings': 'Ajustes',
      'home_warrior': 'Guerrero',
      'home_streak_label': 'DIA DE RACHA',
      'home_streak': 'RACHA',
      'home_quote_title': 'CITA DEL DIA',
      'home_companion_earned': 'COMPANERO DESBLOQUEADO!',
      'home_companion_earned_desc': 'Ya no estas solo, guerrero. Ahora tienes un caballo!',
      'home_companion_btn': 'NOMBRAR COMPANERO',
      'home_companion_label': 'Companero Leal',
      'home_mot_1': 'Diste el primer paso. No hay vuelta atras.',
      'home_mot_2': 'Tu disciplina se esta formando. No rompas tus filas.',
      'home_mot_3': 'Tu voluntad de hierro nace. No te dobles ante la presion.',
      'home_mot_4': 'Estas abriendo el camino ahora. Sigue avanzando.',
      'home_mot_5': 'Tu voluntad manda, tu debilidad calla.',
      'home_mot_6': 'Ganaste tu trono. Ahora reina sobre el.',
      'dialog_name_title': 'NOMBRAR COMPANERO',
      'dialog_name_desc': 'Tu leal companero correracorrrera contigo en esta sagrada lucha. Como quieres llamarlo?',
      'dialog_name_hint': 'Nombre del companero...',
      'dialog_btn_save': 'GUARDAR',
      'dialog_btn_cancel': 'CANCELAR',
      'goals_title': 'OBJETIVOS',
      'goals_limit_warning': 'Guerrero, puedes tener un maximo de 6 objetivos activos al mismo tiempo!',
      'goals_add_title': 'NUEVO OBJETIVO',
      'goals_edit_title': 'EDITAR OBJETIVO',
      'goals_input_title': 'NOMBRE DEL OBJETIVO',
      'goals_input_title_hint': 'Escribe tu objetivo...',
      'goals_input_desc': 'DESCRIPCION (OPCIONAL)',
      'goals_input_desc_hint': 'Anade una descripcion si quieres...',
      'goals_input_category': 'CATEGORIA (OPCIONAL)',
      'goals_repeat_label': 'REPETICION',
      'goals_everyday_label': 'Cada dia',
      'goals_btn_add': 'ANADIR NUEVO OBJETIVO',
      'goals_btn_update': 'ACTUALIZAR',
      'goals_btn_remove': 'ELIMINAR OBJETIVO',
      'goals_empty_state': 'Aun no tienes un plan de batalla.\nEmpieza la lucha anadiendo un nuevo objetivo!',
      'goals_subtitle': 'Completa tus objetivos cada dia, manten tu racha y continua tu viaje.',
      'snack_goal_empty': 'El nombre del objetivo no puede estar vacio!',
      'journey_title': 'VIAJE',
      'journey_acemi': 'Nivel I - NOVATO',
      'journey_muhafiz': 'Nivel II - GUARDIAN',
      'journey_celik_muhafiz': 'Nivel III - GUARDIAN DE HIERRO',
      'journey_sovalye': 'Nivel IV - CABALLERO',
      'journey_komutan': 'Nivel V - COMANDANTE',
      'journey_kral': 'Nivel VI - REY',
      'journey_acemi_desc': 'Primeros pasos del reino. Todavia eres un guerrero sin experiencia.',
      'journey_muhafiz_desc': 'Las puertas del reino se abren para ti. Ganaste el titulo de guardian.',
      'journey_celik_desc': 'Tu armadura es mas fuerte ahora. No te rendiste durante 21 dias.',
      'journey_sovalye_desc': 'Eres invencible desde hace 100 dias. Ganaste un companero leal.',
      'journey_komutan_desc': 'Llevas 200 dias comandando ejercitos.',
      'journey_kral_desc': '365 dias! El trono del reino es tuyo!',
      'stats_title': 'ESTADISTICAS',
      'stats_month_label': 'JULIO 2026',
      'stats_discipline': 'PUNTUACION MENSUAL DE DISCIPLINA',
      'stats_completed': 'COMPLETADO',
      'stats_missed': 'PERDIDO',
      'stats_perfect': 'DIAS PERFECTOS',
      'stats_performance': 'RENDIMIENTO DE OBJETIVOS',
      'stats_no_data': 'Aun no se han registrado datos para este mes.',
      'stats_quote': 'La disciplina es la clave definitiva de la libertad.',
      'stats_unit_goal': 'objetivos',
      'stats_unit_day': 'dias',
      'stats_growth': 'Mejora respecto\nal mes anterior',
      'stats_deleted_goal': 'Objetivo Eliminado',
      'cal_discipline_short': 'DISC. MENSUAL',
      'cal_no_data': 'Sin datos',
      'settings_title': 'GESTION DEL REINO',
      'settings_subtitle': 'PANEL DE CONTROL DEL GUERRERO',
      'settings_sec_profile': 'GUERRERO & COMPANERO',
      'settings_sec_shop': 'HERRERO & TIENDA',
      'settings_sec_app': 'AJUSTES DEL PERGAMINO',
      'settings_change_name': 'Cambiar Nombre de Guerrero',
      'settings_change_companion': 'Cambiar Nombre del Companero',
      'settings_companion_locked': 'Bloqueado (Se requiere Dia 100)',
      'settings_companion_no_name': 'Sin nombre asignado',
      'settings_sign_out': 'Abandonar Reino (Cerrar sesion)',
      'settings_sign_out_sub': 'Pausar temporalmente tu lucha',
      'settings_remove_ads': 'ELIMINAR ANUNCIOS',
      'settings_remove_ads_sub': 'No te distraigas mientras luchas',
      'settings_buy_btn': 'COMPRAR',
      'settings_rate': 'Calificar Reino',
      'settings_rate_sub': 'Calificanos en la tienda del mercado',
      'settings_notifications': 'Recordatorios Diarios',
      'settings_notifications_sub': 'No pierdas el dia, completa las tareas',
      'settings_lang': 'Seleccion de Idioma',
      'settings_bg_music': 'Musica de Fondo',
      'settings_bg_music_sub': 'Activar/desactivar musica o ajustar volumen',
      'settings_music_select': 'Seleccion de Musica',
      'settings_music_select_sub': 'Cambiar la musica de fondo',
      'settings_music_title': 'SELECCION DE MUSICA',
      'settings_reset': 'Reiniciar Viaje (Renacimiento)',
      'settings_reset_sub': 'Eliminar todos los objetivos e historial y comenzar de nuevo',
      'settings_dialog_rename_user': 'RENOMBRAR GUERRERO',
      'settings_dialog_rename_user_desc': 'Ingresa tu nuevo nombre de guerrero.',
      'settings_dialog_rename_comp': 'RENOMBRAR COMPANERO',
      'settings_dialog_rename_comp_desc': 'Otorga un nuevo nombre a tu leal companero.',
      'settings_dialog_sign_out_title': 'ABANDONAR REINO',
      'settings_dialog_sign_out_desc': 'Estas seguro de que quieres abandonar el reino, guerrero?',
      'settings_dialog_sign_out_btn_stay': 'QUEDARME',
      'settings_dialog_sign_out_btn_leave': 'SALIR',
      'settings_dialog_reset_title': 'RENACIMIENTO',
      'settings_dialog_reset_desc': 'Todos tus objetivos y progreso seran reiniciados. Esta accion no se puede deshacer!',
      'settings_dialog_reset_btn_cancel': 'CANCELAR',
      'settings_dialog_reset_btn_reset': 'REINICIAR',
      'snack_unlocked_soon': 'El herrero forjara nuevas armaduras pronto!',
      'snack_rate_thanks': 'Gracias por apoyar nuestro reino, guerrero!',
      'snack_settings_updated': 'Tu configuracion se ha actualizado correctamente!',
      'snack_notif_updated': 'Configuracion de notificaciones actualizada!',
      'snack_reset_success': 'Has renacido de tus cenizas, guerrero!',
    },
    'fr': {
      'welcome_title': 'PainToGain',
      'welcome_subtitle': 'Faites le premier pas vers votre nouvelle vie\nMotivation d ecran de verrouillage et assistant d habitudes quotidiennes.',
      'welcome_start': 'Entrer dans Votre Nouvelle Vie',
      'btn_google_signin': 'Se connecter avec Google',
      'btn_apple_signin': 'Se connecter avec Apple',
      'onboarding1_title': 'ES-TU PRET POUR LA GUERRE?',
      'onboarding1_box1_title': 'SERMENT',
      'onboarding1_box1_desc': 'La victoire ne se gagne pas en un jour. La loyaute se gagne chaque jour.',
      'onboarding1_box2_title': 'EVOLUTION',
      'onboarding1_box2_desc': 'A mesure que votre loyaute augmente, vous evoluez egalement.',
      'onboarding1_box3_title': 'LA LOI',
      'onboarding1_box3_desc': 'Un jour de silence... reinitialise votre loyaute.',
      'onboarding1_prompt': 'Jurez-vous de rester fidele a votre volonte?',
      'onboarding1_btn': 'JE LE JURE',
      'onboarding2_title': 'ES-TU PRET POUR LA GUERRE?',
      'onboarding2_desc': 'LES DECISIONS QUE VOUS PRENDREZ AUJOURD HUI,\nDETERMINERONT QUI VOUS SEREZ DEMAIN.',
      'onboarding2_btn': 'CONTINUER',
      'onboarding_title_1': 'DEFINISSEZ VOTRE COMBAT',
      'onboarding_desc_1': 'Choisissez vos objectifs de discipline ou creez les votres. Ces objectifs poseront les bases de votre royaume.',
      'onboarding_title_2': 'NE JAMAIS BRISER LA CHAINE',
      'onboarding_desc_2': 'Maintenez votre serie en accomplissant vos taches quotidiennes. Votre royaume grandira autant que votre discipline.',
      'onboarding_btn_next': 'SUIVANT',
      'onboarding_btn_back': 'RETOUR',
      'onboarding_input_name': 'Quel est Votre Nom de Guerrier?',
      'onboarding_input_name_hint': 'Entrez votre nom, guerrier...',
      'nav_home': 'Accueil',
      'nav_goals': 'Objectifs',
      'nav_stats': 'Statistiques',
      'nav_journey': 'Voyage',
      'nav_settings': 'Parametres',
      'home_warrior': 'Guerrier',
      'home_streak_label': 'JOUR DE SERIE',
      'home_streak': 'SERIE',
      'home_quote_title': 'CITATION DU JOUR',
      'home_companion_earned': 'COMPAGNON DEBLOQUE!',
      'home_companion_earned_desc': 'Tu n es plus seul, guerrier. Tu as maintenant un cheval!',
      'home_companion_btn': 'NOMMER LE COMPAGNON',
      'home_companion_label': 'Compagnon Fidele',
      'home_mot_1': 'Tu as fait le premier pas. Il n y a plus de retour en arriere.',
      'home_mot_2': 'Ta discipline se forme. Ne brise pas tes rangs.',
      'home_mot_3': 'Ta volonte de fer est nee. Ne cede pas a la pression.',
      'home_mot_4': 'Tu ouvres le chemin maintenant. Continue d avancer.',
      'home_mot_5': 'Ta volonte commande, ta faiblesse se tait.',
      'home_mot_6': 'Tu as gagne ton trone. Regne maintenant sur lui.',
      'dialog_name_title': 'NOMMER LE COMPAGNON',
      'dialog_name_desc': 'Ton fidele compagnon courra avec toi dans cette lutte sacree. Comment voudrais-tu l appeler?',
      'dialog_name_hint': 'Nom du compagnon...',
      'dialog_btn_save': 'ENREGISTRER',
      'dialog_btn_cancel': 'ANNULER',
      'goals_title': 'OBJECTIFS',
      'goals_limit_warning': 'Guerrier, tu peux avoir un maximum de 6 objectifs actifs en meme temps!',
      'goals_add_title': 'NOUVEL OBJECTIF',
      'goals_edit_title': 'MODIFIER L OBJECTIF',
      'goals_input_title': 'NOM DE L OBJECTIF',
      'goals_input_title_hint': 'Ecris ton objectif...',
      'goals_input_desc': 'DESCRIPTION (OPTIONNEL)',
      'goals_input_desc_hint': 'Ajoute une description si tu veux...',
      'goals_input_category': 'CATEGORIE (OPTIONNEL)',
      'goals_repeat_label': 'REPETITION',
      'goals_everyday_label': 'Chaque jour',
      'goals_btn_add': 'AJOUTER UN NOUVEL OBJECTIF',
      'goals_btn_update': 'METTRE A JOUR',
      'goals_btn_remove': 'SUPPRIMER L OBJECTIF',
      'goals_empty_state': 'Tu n as pas encore de plan de bataille.\nCommence la lutte en ajoutant un nouvel objectif!',
      'goals_subtitle': 'Accomplis tes objectifs chaque jour, maintiens ta serie et continue ton voyage.',
      'snack_goal_empty': 'Le nom de l objectif ne peut pas etre vide!',
      'journey_title': 'VOYAGE',
      'journey_acemi': 'Niveau I - NOVICE',
      'journey_muhafiz': 'Niveau II - GARDIEN',
      'journey_celik_muhafiz': 'Niveau III - GARDIEN DE FER',
      'journey_sovalye': 'Niveau IV - CHEVALIER',
      'journey_komutan': 'Niveau V - COMMANDANT',
      'journey_kral': 'Niveau VI - ROI',
      'journey_acemi_desc': 'Premiers pas du royaume. Tu es encore un guerrier inexp erimente.',
      'journey_muhafiz_desc': 'Les portes du royaume s ouvrent pour toi. Tu as gagne le titre de gardien.',
      'journey_celik_desc': 'Ton armure est plus solide maintenant. Tu n as pas abandonne pendant 21 jours.',
      'journey_sovalye_desc': 'Tu es invincible depuis 100 jours. Tu as gagne un compagnon fidele.',
      'journey_komutan_desc': 'Tu commandes des armees depuis 200 jours.',
      'journey_kral_desc': '365 jours! Le trone du royaume est tien!',
      'stats_title': 'STATISTIQUES',
      'stats_month_label': 'JUILLET 2026',
      'stats_discipline': 'SCORE DE DISCIPLINE MENSUEL',
      'stats_completed': 'COMPLETE',
      'stats_missed': 'MANQUE',
      'stats_perfect': 'JOURS PARFAITS',
      'stats_performance': 'PERFORMANCE DES OBJECTIFS',
      'stats_no_data': 'Aucune donnee enregistree pour ce mois.',
      'stats_quote': 'La discipline est la veritable cle de la liberte.',
      'stats_unit_goal': 'objectifs',
      'stats_unit_day': 'jours',
      'stats_growth': 'Amelioration par rapport\nau mois dernier',
      'stats_deleted_goal': 'Objectif Supprime',
      'cal_discipline_short': 'DISC. MENSUELLE',
      'cal_no_data': 'Aucune donnee',
      'settings_title': 'GESTION DU ROYAUME',
      'settings_subtitle': 'PANNEAU DE CONTROLE DU GUERRIER',
      'settings_sec_profile': 'GUERRIER & COMPAGNON',
      'settings_sec_shop': 'FORGERON & BOUTIQUE',
      'settings_sec_app': 'PARAMETRES DU PARCHEMIN',
      'settings_change_name': 'Changer le Nom du Guerrier',
      'settings_change_companion': 'Changer le Nom du Compagnon',
      'settings_companion_locked': 'Verrouille (Jour 100 requis)',
      'settings_companion_no_name': 'Aucun nom attribue',
      'settings_sign_out': 'Quitter le Royaume (Deconnexion)',
      'settings_sign_out_sub': 'Mettez temporairement votre lutte en pause',
      'settings_remove_ads': 'SUPPRIMER LES PUBLICITES',
      'settings_remove_ads_sub': 'Ne soyez pas distrait pendant le combat',
      'settings_buy_btn': 'ACHETER',
      'settings_rate': 'Evaluer le Royaume',
      'settings_rate_sub': 'Evaluez-nous sur le marche',
      'settings_notifications': 'Rappels Quotidiens',
      'settings_notifications_sub': 'Ne manquez pas le jour, accomplissez les taches',
      'settings_lang': 'Selection de la Langue',
      'settings_bg_music': 'Musique de Fond',
      'settings_bg_music_sub': 'Allumer/eteindre la musique ou ajuster le volume',
      'settings_music_select': 'Selection de Musique',
      'settings_music_select_sub': 'Changer la musique de fond',
      'settings_music_title': 'SELECTION DE MUSIQUE',
      'settings_reset': 'Reinitialiser le Voyage (Renaissance)',
      'settings_reset_sub': 'Supprimer tous les objectifs et l historique et recommencer',
      'settings_dialog_rename_user': 'RENOMMER LE GUERRIER',
      'settings_dialog_rename_user_desc': 'Entrez votre nouveau nom de guerrier.',
      'settings_dialog_rename_comp': 'RENOMMER LE COMPAGNON',
      'settings_dialog_rename_comp_desc': 'Accordez un nouveau nom a votre fidele compagnon.',
      'settings_dialog_sign_out_title': 'QUITTER LE ROYAUME',
      'settings_dialog_sign_out_desc': 'Es-tu sur de vouloir quitter le royaume, guerrier?',
      'settings_dialog_sign_out_btn_stay': 'RESTER',
      'settings_dialog_sign_out_btn_leave': 'PARTIR',
      'settings_dialog_reset_title': 'RENAISSANCE',
      'settings_dialog_reset_desc': 'Tous tes objectifs et progression seront reinitialises. Cette action ne peut pas etre annulee!',
      'settings_dialog_reset_btn_cancel': 'ANNULER',
      'settings_dialog_reset_btn_reset': 'REINITIALISER',
      'snack_unlocked_soon': 'Le forgeron forgera bientot de nouvelles armures!',
      'snack_rate_thanks': 'Merci pour ton soutien a notre royaume, guerrier!',
      'snack_settings_updated': 'Tes parametres ont ete mis a jour avec succes!',
      'snack_notif_updated': 'Parametres de notification mis a jour!',
      'snack_reset_success': 'Tu es renait de tes cendres, guerrier!',
    },
    'it': {
      'welcome_title': 'PainToGain',
      'welcome_subtitle': 'Fai il primo passo verso la tua nuova vita\nIl tuo assistente per la motivazione sulla schermata di blocco e le abitudini quotidiane.',
      'welcome_start': 'Accedi alla Tua Nuova Vita',
      'btn_google_signin': 'Accedi con Google',
      'btn_apple_signin': 'Accedi con Apple',
      'onboarding1_title': 'SEI PRONTO PER LA BATTAGLIA?',
      'onboarding1_box1_title': 'GIURAMENTO',
      'onboarding1_box1_desc': 'La vittoria non si ottiene in un giorno. La lealtà si guadagna ogni giorno.',
      'onboarding1_box2_title': 'EVOLUZIONE',
      'onboarding1_box2_desc': 'Man mano che la tua lealtà aumenta, ti evolvi.',
      'onboarding1_box3_title': 'LEGGE',
      'onboarding1_box3_desc': 'Un giorno di silenzio... resetta la tua lealtà.',
      'onboarding1_prompt': 'Giuri di rimanere fedele alla tua volontà?',
      'onboarding1_btn': 'LO GIURO',
      'onboarding2_title': 'SEI PRONTO PER LA BATTAGLIA?',
      'onboarding2_desc': 'LE DECISIONI CHE PRENDI OGGI,\nDETERMINERANNO CHI SARAI DOMANI.',
      'onboarding2_btn': 'CONTINUA',
      'onboarding_title_1': 'DETERMINA LA TUA LOTTA',
      'onboarding_desc_1': 'Scegli gli obiettivi in cui vuoi essere disciplinato o creane di tuoi. Questi obiettivi formeranno le fondamenta del tuo regno.',
      'onboarding_title_2': 'NON SPEZZARE MAI LA CATENA',
      'onboarding_desc_2': 'Mantieni la tua serie completando le tue attività ogni giorno. Il tuo regno crescerà con la tua disciplina.',
      'onboarding_btn_next': 'AVANTI',
      'onboarding_btn_back': 'INDIETRO',
      'onboarding_input_name': 'Qual è il Tuo Nome da Guerriero?',
      'onboarding_input_name_hint': 'Inserisci il tuo nome, guerriero...',
      'nav_home': 'Home',
      'nav_goals': 'Obiettivi',
      'nav_stats': 'Statistiche',
      'nav_journey': 'Viaggio',
      'nav_settings': 'Impostazioni',
      'home_warrior': 'Guerriero',
      'home_streak_label': 'GIORNO DI LOTTA',
      'home_streak': 'LOTTA',
      'home_quote_title': 'CITAZIONE DEL GIORNO',
      'home_companion_earned': 'HAI GUADAGNATO UN COMPAGNO!',
      'home_companion_earned_desc': 'Da ora in poi non sei solo, guerriero. Il tuo prossimo viaggio sarà molto più facile. Ora hai un cavallo!',
      'home_companion_btn': 'DAI UN NOME AL TUO COMPAGNO',
      'home_companion_label': 'Compagno Fedele',
      'home_mot_1': 'Hai fatto il primo passo. Ora non si torna indietro.',
      'home_mot_2': 'La tua disciplina sta prendendo forma. Non rompere i ranghi.',
      'home_mot_3': 'Nasce la tua volontà d\'acciaio. Non cedere alla pressione.',
      'home_mot_4': 'Ora stai aprendo la strada. Continua ad avanzare.',
      'home_mot_5': 'La tua volontà comanda, la tua debolezza tace.',
      'home_mot_6': 'Hai guadagnato il tuo trono. Ora governalo.',
      'dialog_name_title': 'DAI UN NOME AL COMPAGNO',
      'dialog_name_desc': 'Il tuo fedele compagno correrà con te in questa sacra lotta. Come vorresti chiamarlo?',
      'dialog_name_hint': 'Nome del compagno...',
      'dialog_btn_save': 'SALVA',
      'dialog_btn_cancel': 'ANNULLA',
      'goals_title': 'OBIETTIVI',
      'goals_limit_warning': 'Guerriero, puoi avere un massimo di 6 obiettivi attivi contemporaneamente!',
      'goals_add_title': 'NUOVO OBIETTIVO',
      'goals_edit_title': 'MODIFICA OBIETTIVO',
      'goals_input_title': 'NOME DELL\'OBIETTIVO',
      'goals_input_title_hint': 'Scrivi il tuo obiettivo...',
      'goals_input_desc': 'DESCRIZIONE (OPZIONALE)',
      'goals_input_desc_hint': 'Aggiungi una descrizione se vuoi...',
      'goals_input_category': 'CATEGORIA (OPZIONALE)',
      'goals_repeat_label': 'RIPETIZIONE',
      'goals_everyday_label': 'Ogni giorno',
      'goals_btn_add': 'AGGIUNGI NUOVO OBIETTIVO',
      'goals_btn_update': 'AGGIORNA',
      'goals_btn_remove': 'RIMUOVI OBIETTIVO',
      'goals_empty_state': 'Non hai ancora un piano di battaglia.\nInizia la lotta aggiungendo un nuovo obiettivo!',
      'goals_subtitle': 'Completa i tuoi obiettivi ogni giorno, mantieni la tua serie e continua il tuo viaggio.',
      'snack_goal_empty': 'Il nome dell\'obiettivo non può essere vuoto!',
      'journey_title': 'VIAGGIO',
      'journey_acemi': 'Livello I - NOVIZIO',
      'journey_muhafiz': 'Livello II - GUARDIA',
      'journey_celik_muhafiz': 'Livello III - GUARDIA D\'ACCIAIO',
      'journey_sovalye': 'Livello IV - CAVALIERE',
      'journey_komutan': 'Livello V - COMANDANTE',
      'journey_kral': 'Livello VI - RE',
      'journey_acemi_desc': 'I primi passi del regno. Sei ancora un guerriero inesperto.',
      'journey_muhafiz_desc': 'Le porte del regno si aprono per te. Hai guadagnato il titolo di guardia.',
      'journey_celik_desc': 'La tua armatura è più forte ora. Non ti sei arreso per 21 giorni.',
      'journey_sovalye_desc': 'Sei stato invincibile per 100 giorni. Hai guadagnato un compagno fedele.',
      'journey_komutan_desc': 'Hai comandato eserciti per 200 giorni.',
      'journey_kral_desc': '365 giorni! Il trono del regno è tuo!',
      'stats_title': 'STATISTICHE',
      'stats_month_label': 'LUGLIO 2026',
      'stats_discipline': 'PUNTEGGIO DISCIPLINA MENSILE',
      'stats_completed': 'COMPLETATI',
      'stats_missed': 'MANCATI',
      'stats_perfect': 'GIORNI PERFETTI',
      'stats_performance': 'PRESTAZIONI DEGLI OBIETTIVI',
      'stats_no_data': 'Nessun dato registrato per questo mese.',
      'stats_quote': 'La disciplina è la vera chiave della libertà.',
      'stats_unit_goal': 'obiettivi',
      'stats_unit_day': 'giorni',
      'stats_growth': 'Miglioramento rispetto\nal mese scorso',
      'stats_deleted_goal': 'Obiettivo Eliminato',
      'cal_discipline_short': 'DISC. MENSILE',
      'cal_no_data': 'Nessun dato',
      'settings_title': 'GESTIONE DEL REGNO',
      'settings_subtitle': 'PANNELLO DI CONTROLLO DEL GUERRIERO',
      'settings_sec_profile': 'GUERRIERO E COMPAGNO',
      'settings_sec_shop': 'FABBRO E NEGOZIO',
      'settings_sec_app': 'IMPOSTAZIONI PERGAMENA',
      'settings_change_name': 'Cambia il Nome del Guerriero',
      'settings_change_companion': 'Cambia il Nome del Compagno',
      'settings_companion_locked': 'Bloccato (Richiede Giorno 100)',
      'settings_companion_no_name': 'Nessun nome assegnato',
      'settings_sign_out': 'Lascia il Regno (Esci)',
      'settings_sign_out_sub': 'Metti in pausa temporaneamente la tua lotta',
      'settings_remove_ads': 'RIMUOVI ANNUNCI',
      'settings_remove_ads_sub': 'Non farti distrarre durante il combattimento',
      'settings_buy_btn': 'ACQUISTA',
      'settings_rate': 'Valuta il Regno',
      'settings_rate_sub': 'Valutaci sul mercato',
      'settings_notifications': 'Promemoria Quotidiani',
      'settings_notifications_sub': 'Non perdere la giornata, completa i compiti',
      'settings_lang': 'Selezione della Lingua',
      'settings_bg_music': 'Musica di Sottofondo',
      'settings_bg_music_sub': 'Accendi/spegni la musica o regola il volume',
      'settings_music_select': 'Selezione Musicale',
      'settings_music_select_sub': 'Cambia la musica di sottofondo',
      'settings_music_title': 'SELEZIONE MUSICALE',
      'settings_reset': 'Ripristina Viaggio (Rinascita)',
      'settings_reset_sub': 'Elimina tutti gli obiettivi e la cronologia e ricomincia da capo',
      'settings_dialog_rename_user': 'RINOMINA GUERRIERO',
      'settings_dialog_rename_user_desc': 'Inserisci il tuo nuovo nome da guerriero.',
      'settings_dialog_rename_comp': 'RINOMINA COMPAGNO',
      'settings_dialog_rename_comp_desc': 'Assegna un nuovo nome al tuo fedele compagno.',
      'settings_dialog_sign_out_title': 'LASCIA IL REGNO',
      'settings_dialog_sign_out_desc': 'Sei sicuro di voler lasciare il regno, guerriero?',
      'settings_dialog_sign_out_btn_stay': 'RIMANI',
      'settings_dialog_sign_out_btn_leave': 'LASCIA',
      'settings_dialog_reset_title': 'RINASCITA',
      'settings_dialog_reset_desc': 'Tutti i tuoi obiettivi e progressi verranno ripristinati. Questa azione non può essere annullata!',
      'settings_dialog_reset_btn_cancel': 'ANNULLA',
      'settings_dialog_reset_btn_reset': 'RIPRISTINA',
      'snack_unlocked_soon': 'Il fabbro forgerà presto nuove armature!',
      'snack_rate_thanks': 'Grazie per il tuo supporto al nostro regno, guerriero!',
      'snack_settings_updated': 'Le tue impostazioni sono state aggiornate con successo!',
      'snack_notif_updated': 'Impostazioni di notifica aggiornate!',
      'snack_reset_success': 'Sei rinato dalle tue ceneri, guerriero!',
    },
    'pt': {
      'welcome_title': 'PainToGain',
      'welcome_subtitle': 'Dê o primeiro passo para a sua nova vida\nSeu assistente de motivação na tela de bloqueio e hábitos diários.',
      'welcome_start': 'Entre na Sua Nova Vida',
      'btn_google_signin': 'Entrar com Google',
      'btn_apple_signin': 'Entrar com Apple',
      'onboarding1_title': 'VOCÊ ESTÁ PRONTO PARA A BATALHA?',
      'onboarding1_box1_title': 'JURAMENTO',
      'onboarding1_box1_desc': 'A vitória não é ganha em um dia. A lealdade é conquistada todos os dias.',
      'onboarding1_box2_title': 'EVOLUÇÃO',
      'onboarding1_box2_desc': 'Conforme sua lealdade aumenta, você evolui.',
      'onboarding1_box3_title': 'LEI',
      'onboarding1_box3_desc': 'Um dia de silêncio... zera sua lealdade.',
      'onboarding1_prompt': 'Você jura permanecer fiel à sua vontade?',
      'onboarding1_btn': 'EU JURO',
      'onboarding2_title': 'VOCÊ ESTÁ PRONTO PARA A BATALHA?',
      'onboarding2_desc': 'AS DECISÕES QUE VOCÊ TOMA HOJE,\nDETERMINARÃO QUEM VOCÊ SERÁ AMANHÃ.',
      'onboarding2_btn': 'CONTINUAR',
      'onboarding_title_1': 'DETERMINE SUA LUTA',
      'onboarding_desc_1': 'Escolha os objetivos nos quais deseja ser disciplinado ou crie os seus próprios. Esses objetivos formarão a base do seu reino.',
      'onboarding_title_2': 'NUNCA QUEBRE A CORRENTE',
      'onboarding_desc_2': 'Mantenha sua sequência completando suas tarefas todos os dias. Seu reino crescerá com sua disciplina.',
      'onboarding_btn_next': 'AVANÇAR',
      'onboarding_btn_back': 'VOLTAR',
      'onboarding_input_name': 'Qual é o Seu Nome de Guerreiro?',
      'onboarding_input_name_hint': 'Digite seu nome, guerreiro...',
      'nav_home': 'Início',
      'nav_goals': 'Objetivos',
      'nav_stats': 'Estatísticas',
      'nav_journey': 'Jornada',
      'nav_settings': 'Configurações',
      'home_warrior': 'Guerreiro',
      'home_streak_label': 'DIA DE LUTA',
      'home_streak': 'LUTA',
      'home_quote_title': 'CITAÇÃO DO DIA',
      'home_companion_earned': 'VOCÊ GANHOU UM COMPANHEIRO!',
      'home_companion_earned_desc': 'De agora em diante você não está sozinho, guerreiro. Sua próxima jornada será muito mais fácil. Agora você tem um cavalo!',
      'home_companion_btn': 'NOMEIE SEU COMPANHEIRO',
      'home_companion_label': 'Companheiro Fiel',
      'home_mot_1': 'Você deu o primeiro passo. Agora não tem volta.',
      'home_mot_2': 'Sua disciplina está tomando forma. Não quebre as fileiras.',
      'home_mot_3': 'Sua vontade de ferro nasceu. Não ceda à pressão.',
      'home_mot_4': 'Agora você está abrindo o caminho. Continue avançando.',
      'home_mot_5': 'Sua vontade comanda, sua fraqueza se cala.',
      'home_mot_6': 'Você ganhou seu trono. Agora governe-o.',
      'dialog_name_title': 'NOMEAR O COMPANHEIRO',
      'dialog_name_desc': 'Seu companheiro fiel correrá com você nesta luta sagrada. Como você gostaria de chamá-lo?',
      'dialog_name_hint': 'Nome do companheiro...',
      'dialog_btn_save': 'SALVAR',
      'dialog_btn_cancel': 'CANCELAR',
      'goals_title': 'OBJETIVOS',
      'goals_limit_warning': 'Guerreiro, você pode ter no máximo 6 objetivos ativos ao mesmo tempo!',
      'goals_add_title': 'NOVO OBJETIVO',
      'goals_edit_title': 'EDITAR OBJETIVO',
      'goals_input_title': 'NOME DO OBJETIVO',
      'goals_input_title_hint': 'Escreva seu objetivo...',
      'goals_input_desc': 'DESCRIÇÃO (OPCIONAL)',
      'goals_input_desc_hint': 'Adicione uma descrição se quiser...',
      'goals_input_category': 'CATEGORIA (OPCIONAL)',
      'goals_repeat_label': 'REPETIÇÃO',
      'goals_everyday_label': 'Todos os dias',
      'goals_btn_add': 'ADICIONAR NOVO OBJETIVO',
      'goals_btn_update': 'ATUALIZAR',
      'goals_btn_remove': 'REMOVER OBJETIVO',
      'goals_empty_state': 'Você ainda não tem um plano de batalha.\nComece a luta adicionando um novo objetivo!',
      'goals_subtitle': 'Conclua seus objetivos todos os dias, mantenha sua sequência e continue sua jornada.',
      'snack_goal_empty': 'O nome do objetivo não pode estar vazio!',
      'journey_title': 'JORNADA',
      'journey_acemi': 'Nível I - NOVIÇO',
      'journey_muhafiz': 'Nível II - GUARDA',
      'journey_celik_muhafiz': 'Nível III - GUARDA DE FERRO',
      'journey_sovalye': 'Nível IV - CAVALEIRO',
      'journey_komutan': 'Nível V - COMANDANTE',
      'journey_kral': 'Nível VI - REI',
      'journey_acemi_desc': 'Primeiros passos do reino. Você ainda é um guerreiro inexperiente.',
      'journey_muhafiz_desc': 'Os portões do reino se abrem para você. Você ganhou o título de guarda.',
      'journey_celik_desc': 'Sua armadura é mais forte agora. Você não desistiu por 21 dias.',
      'journey_sovalye_desc': 'Você foi invencível por 100 dias. Você ganhou um companheiro fiel.',
      'journey_komutan_desc': 'Você comandou exércitos por 200 dias.',
      'journey_kral_desc': '365 dias! O trono do reino é seu!',
      'stats_title': 'ESTATÍSTICAS',
      'stats_month_label': 'JULHO DE 2026',
      'stats_discipline': 'PONTUAÇÃO DE DISCIPLINA MENSAL',
      'stats_completed': 'CONCLUÍDOS',
      'stats_missed': 'PERDIDOS',
      'stats_perfect': 'DIAS PERFEITOS',
      'stats_performance': 'DESEMPENHO DOS OBJETIVOS',
      'stats_no_data': 'Nenhum dado registrado para este mês.',
      'stats_quote': 'A disciplina é a verdadeira chave para a liberdade.',
      'stats_unit_goal': 'objetivos',
      'stats_unit_day': 'dias',
      'stats_growth': 'Melhoria em relação\nao mês passado',
      'stats_deleted_goal': 'Objetivo Excluído',
      'cal_discipline_short': 'DISC. MENSAL',
      'cal_no_data': 'Nenhum dado',
      'settings_title': 'GESTÃO DO REINO',
      'settings_subtitle': 'PAINEL DE CONTROLE DO GUERREIRO',
      'settings_sec_profile': 'GUERREIRO E COMPANHEIRO',
      'settings_sec_shop': 'FERREIRO E LOJA',
      'settings_sec_app': 'CONFIGURAÇÕES DO PERGAMINHO',
      'settings_change_name': 'Alterar Nome do Guerreiro',
      'settings_change_companion': 'Alterar Nome do Companheiro',
      'settings_companion_locked': 'Bloqueado (Requer Dia 100)',
      'settings_companion_no_name': 'Nenhum nome atribuído',
      'settings_sign_out': 'Deixar o Reino (Sair)',
      'settings_sign_out_sub': 'Pause temporariamente a sua luta',
      'settings_remove_ads': 'REMOVER ANÚNCIOS',
      'settings_remove_ads_sub': 'Não se distraia durante o combate',
      'settings_buy_btn': 'COMPRAR',
      'settings_rate': 'Avaliar o Reino',
      'settings_rate_sub': 'Avalie-nos no mercado',
      'settings_notifications': 'Lembretes Diários',
      'settings_notifications_sub': 'Não perca o dia, conclua as tarefas',
      'settings_lang': 'Seleção de Idioma',
      'settings_bg_music': 'Música de Fundo',
      'settings_bg_music_sub': 'Ligar/desligar música ou ajustar o volume',
      'settings_music_select': 'Seleção de Música',
      'settings_music_select_sub': 'Mudar música de fundo',
      'settings_music_title': 'SELEÇÃO DE MÚSICA',
      'settings_reset': 'Redefinir Jornada (Renascimento)',
      'settings_reset_sub': 'Exclua todos os objetivos e histórico e comece de novo',
      'settings_dialog_rename_user': 'RENOMEAR GUERREIRO',
      'settings_dialog_rename_user_desc': 'Digite seu novo nome de guerreiro.',
      'settings_dialog_rename_comp': 'RENOMEAR COMPANHEIRO',
      'settings_dialog_rename_comp_desc': 'Dê um novo nome ao seu companheiro fiel.',
      'settings_dialog_sign_out_title': 'DEIXAR O REINO',
      'settings_dialog_sign_out_desc': 'Tem certeza de que deseja deixar o reino, guerreiro?',
      'settings_dialog_sign_out_btn_stay': 'FICAR',
      'settings_dialog_sign_out_btn_leave': 'DEIXAR',
      'settings_dialog_reset_title': 'RENASCIMENTO',
      'settings_dialog_reset_desc': 'Todos os seus objetivos e progresso serão redefinidos. Esta ação não pode ser desfeita!',
      'settings_dialog_reset_btn_cancel': 'CANCELAR',
      'settings_dialog_reset_btn_reset': 'REDEFINIR',
      'snack_unlocked_soon': 'O ferreiro em breve forjará novas armaduras!',
      'snack_rate_thanks': 'Obrigado pelo seu apoio ao nosso reino, guerreiro!',
      'snack_settings_updated': 'Suas configurações foram atualizadas com sucesso!',
      'snack_notif_updated': 'Configurações de notificação atualizadas!',
      'snack_reset_success': 'Você renasceu das cinzas, guerreiro!',
    }
  };

  String translateQuote(String quoteText) {
    if (locale == 'tr') return quoteText;
    
    final clean = quoteText.replaceAll('“', '').replaceAll('”', '').replaceAll('"', '').trim();
    
    if (clean.contains('rahatlığın bittiği')) {
      if (locale == 'de') return 'Veränderung beginnt, wo die Komfortzone endet.';
      if (locale == 'es') return 'El cambio comienza donde termina la comodidad.';
      if (locale == 'fr') return 'Le changement commence là où finit le confort.';
      return 'Change begins where comfort ends.';
    }
    if (clean.contains('En yükseğe çıkmadan')) {
      if (locale == 'de') return 'Bevor du ganz nach oben steigst, gehst du ganz nach unten.';
      if (locale == 'es') return 'Antes de subir a lo más alto, desciendes a lo más profundo.';
      if (locale == 'fr') return 'Avant de monter au plus haut, tu descends au plus profond.';
      return 'You descend to the deepest before you rise to the highest.';
    }
    if (clean.contains('İyi insanı anlatma')) {
      if (locale == 'de') return 'Sprich nicht darüber, was ein guter Mensch sein sollte; sei einer.';
      if (locale == 'es') return 'No hables sobre lo que debe ser un buen hombre; sé uno.';
      if (locale == 'fr') return 'Ne parle pas de ce que devrait être un homme de bien ; sois-en un.';
      return 'Do not talk about what a good man should be; be one.';
    }
    if (clean.contains('yenilmez ol')) {
      if (locale == 'de') return 'Werde jeden Tag ein wenig unbesiegbarer.';
      if (locale == 'es') return 'Conviértete en un poco más invencible cada día.';
      if (locale == 'fr') return 'Deviens un peu plus invincible chaque jour.';
      return 'Become a little more invincible every day.';
    }
    if (clean.contains('Zorluk yaşamayan')) {
      if (locale == 'de') return 'Wer keine Schwierigkeiten erlebt hat, kann sich nicht beweisen.';
      if (locale == 'es') return 'Quien no ha experimentado dificultades no puede probarse a sí mismo.';
      if (locale == 'fr') return 'Celui qui n\'a pas connu la difficulté ne peut faire ses preuves.';
      return 'He who has not experienced difficulty cannot prove himself.';
    }
    if (clean.contains('Bugünkü savaşın')) {
      if (locale == 'de') return 'Dein heutiger Kampf formt deinen morgigen Charakter.';
      if (locale == 'es') return 'Tu lucha de hoy forja tu carácter de mañana.';
      if (locale == 'fr') return 'Ton combat d\'aujourd\'hui forge ton caractère de demain.';
      return 'Your fight today builds your character tomorrow.';
    }
    if (clean.contains('Güç, devam etmeyi')) {
      if (locale == 'de') return 'Stärke beginnt in dem Moment, in dem du dich entscheidest, weiterzumachen.';
      if (locale == 'es') return 'La fuerza comienza en el momento en que decides seguir adelante.';
      if (locale == 'fr') return 'La force commence au moment où tu choisis de continuer.';
      return 'Strength begins the moment you choose to keep going.';
    }
    if (clean.contains('Bahaneler seni korur')) {
      if (locale == 'de') return 'Ausreden schützen dich, Disziplin verändert dich.';
      if (locale == 'es') return 'Las excusas te protegen, la disciplina te cambia.';
      if (locale == 'fr') return 'Les excuses te protègent, la discipline te change.';
      return 'Excuses protect you, discipline changes you.';
    }
    if (clean.contains('Kendini yenmeden')) {
      if (locale == 'de') return 'Du kannst dein Leben nicht verändern, ohne dich selbst zu besiegen.';
      if (locale == 'es') return 'No puedes cambiar tu vida sin conquistarte a ti mismo.';
      if (locale == 'fr') return 'Tu ne peux pas changer ta vie sans te conquérir toi-même.';
      return 'You cannot change your life without conquering yourself.';
    }
    if (clean.contains('İnsanı olaylar değil')) {
      if (locale == 'de') return 'Menschen werden nicht durch die Dinge beunruhigt, sondern durch ihre Sicht auf die Dinge.';
      if (locale == 'es') return 'A los hombres no les perturban las cosas, sino la visión que tienen de ellas.';
      if (locale == 'fr') return 'Ce qui trouble les hommes, ce ne sont pas les choses, mais les jugements qu\'ils portent sur les choses.';
      return 'People are not disturbed by things, but by the views they take of things.';
    }
    if (clean.contains('İrade büyükse')) {
      if (locale == 'de') return 'Wo der Wille groß ist, können die Schwierigkeiten nicht groß sein.';
      if (locale == 'es') return 'Donde la voluntad es grande, las dificultades no pueden ser grandes.';
      if (locale == 'fr') return 'Là où la volonté est grande, les difficultés ne peuvent l\'être.';
      return 'Where the will is great, the difficulties cannot be great.';
    }
    if (clean.contains('Beni öldürmeyen')) {
      if (locale == 'de') return 'Was mich nicht umbringt, macht mich stärker.';
      if (locale == 'es') return 'Lo que no me mata, me hace más fuerte.';
      if (locale == 'fr') return 'Ce qui ne me tue pas me rend plus fort.';
      return 'What does not kill me, makes me stronger.';
    }
    if (clean.contains('Kazanmak önce zihninde')) {
      if (locale == 'de') return 'Gewinnen beginnt zuerst im Kopf.';
      if (locale == 'es') return 'Ganar comienza primero en la mente.';
      if (locale == 'fr') return 'Gagner commence d\'abord dans l\'esprit.';
      return 'Winning begins in the mind first.';
    }
    if (clean.contains('Bugün kaçtığın şey')) {
      if (locale == 'de') return 'Wovor du heute wegläufst, wird dich morgen wieder konfrontieren.';
      if (locale == 'es') return 'Lo que huyes hoy te enfrentará de nuevo mañana.';
      if (locale == 'fr') return 'Ce que tu fuis aujourd\'hui te confrontera à nouveau demain.';
      return 'What you run away from today will confront you again tomorrow.';
    }
    if (clean.contains('Eski sen direnecek')) {
      if (locale == 'de') return 'Dein altes Ich wird sich wehren, dein neues Ich wird gewinnen.';
      if (locale == 'es') return 'Tu viejo yo resistirá, tu nuevo yo ganará.';
      if (locale == 'fr') return 'L\'ancien toi résistera, le nouveau toi gagnera.';
      return 'The old you will resist, the new you will win.';
    }
    if (clean.contains('Beklediğin kişi')) {
      if (locale == 'de') return 'Die Person, auf die du wartest, ist in deinen Entscheidungen verborgen.';
      if (locale == 'es') return 'La persona que esperas está escondida en las decisiones que tomas.';
      if (locale == 'fr') return 'La personne que tu attends est cachée dans les décisions que tu prends.';
      return 'The person you wait for is hidden in the decisions you make.';
    }
    if (clean.contains('göründüğünü görür')) {
      if (locale == 'de') return 'Jeder sieht, was du zu sein scheinst, wenige erfahren, was du wirklich bist.';
      if (locale == 'es') return 'Todos ven lo que aparentas ser, pocos experimentan lo que realmente eres.';
      if (locale == 'fr') return 'Tout le monde voit ce que tu parais être, peu connaissent ce que tu es vraiment.';
      return 'Everyone sees what you appear to be, few experience what you really are.';
    }
    if (clean.contains('Zorlanıyorsan')) {
      if (locale == 'de') return 'Wenn du kämpfst, gehst du in die richtige Richtung.';
      if (locale == 'es') return 'Si estás luchando, te estás moviendo en la dirección correcta.';
      if (locale == 'fr') return 'Si tu luttes, tu vas dans la bonne direction.';
      return 'If you are struggling, you are moving in the right direction.';
    }
    if (clean.contains('Bugün dayan')) {
      if (locale == 'de') return 'Heute ertragen, morgen herrschen.';
      if (locale == 'es') return 'Aguanta hoy, gobierna mañana.';
      if (locale == 'fr') return 'Endure aujourd\'hui, règne demain.';
      return 'Endure today, rule tomorrow.';
    }
    if (clean.contains('İstek geçer')) {
      if (locale == 'de') return 'Das Verlangen vergeht, der geleistete Eid bleibt.';
      if (locale == 'es') return 'El deseo pasa, el juramento que tomaste permanece.';
      if (locale == 'fr') return 'Le désir passe, le serment que tu as fait demeure.';
      return 'Desire passes, the oath you took remains.';
    }
    if (clean.contains('Acı geçicidir')) {
      if (locale == 'de') return 'Schmerz ist vorübergehend, der Sieg ist ewig.';
      if (locale == 'es') return 'El dolor es temporal, la victoria es eterna.';
      if (locale == 'fr') return 'La douleur est temporaire, la victoire est éternelle.';
      return 'Pain is temporary, victory is eternal.';
    }
    if (clean.contains('zayıflıklarıyla savaşandır')) {
      if (locale == 'de') return 'Ein wahrer Krieger kämpft mehr mit seinen Schwächen als mit seinen Feinden.';
      if (locale == 'es') return 'Un verdadero guerrero lucha contra sus debilidades más que con sus enemigos.';
      if (locale == 'fr') return 'Un vrai guerrier combat ses faiblesses plus que ses ennemis.';
      return 'A true warrior fights his own weaknesses more than his enemies.';
    }
    if (clean.contains('En karanlık gece')) {
      if (locale == 'de') return 'Sogar die dunkelste Nacht weicht der Morgendämmerung.';
      if (locale == 'es') return 'Incluso la noche más oscura cede al amanecer.';
      if (locale == 'fr') return 'Même la nuit la plus sombre cède à l\'aube.';
      return 'Even the darkest night yields to dawn.';
    }
    if (clean.contains('Yüzleşmediğin korkuların')) {
      if (locale == 'de') return 'Die Ängste, denen du dich nicht stellst, setzen deine Grenzen.';
      if (locale == 'es') return 'Los miedos que no enfrentas establecen tus límites.';
      if (locale == 'fr') return 'Les peurs que tu n\'affrontes pas fixent tes limites.';
      return 'The fears you don\'t face set your limits.';
    }
    if (clean.contains('Sadece vazgeçtiğinde')) {
      if (locale == 'de') return 'Du verlierst nur, wenn du aufgibst.';
      if (locale == 'es') return 'Solo pierdes cuando te rindes.';
      if (locale == 'fr') return 'Tu ne perds que lorsque tu abandonnes.';
      return 'You only lose when you give up.';
    }
    if (clean.contains('Bugünün teri')) {
      if (locale == 'de') return 'Der heutige Schweiß ist der morgige Sieg.';
      if (locale == 'es') return 'El sudor de hoy es la victoria de mañana.';
      if (locale == 'fr') return 'La sueur d\'aujourd\'hui est la victoire de demain.';
      return 'Today\'s sweat is tomorrow\'s victory.';
    }
    if (clean.contains('İhanet affedilir')) {
      if (locale == 'de') return 'Verrat wird vergeben, aber niemals sich selbst zu verraten.';
      if (locale == 'es') return 'La traición se perdona, pero traicionarse a sí mismo nunca.';
      if (locale == 'fr') return 'La trahison est pardonnée, mais jamais la trahison de soi-même.';
      return 'Betrayal is forgiven, but never betraying yourself.';
    }
    if (clean.contains('Zorlu yollar')) {
      if (locale == 'de') return 'Harte Wege erschaffen starke Menschen.';
      if (locale == 'es') return 'Caminos difíciles crean personas fuertes.';
      if (locale == 'fr') return 'Les chemins difficiles créent des personnes fortes.';
      return 'Hard paths create strong people.';
    }
    if (clean.contains('Hedefine sadık ol')) {
      if (locale == 'de') return 'Sei deinem Ziel treu, nicht deinen Ausreden.';
      if (locale == 'es') return 'Sé leal a tu objetivo, no a tus excusas.';
      if (locale == 'fr') return 'Sois fidèle à ton objectif, pas à tes excuses.';
      return 'Be loyal to your goal, not to excuses.';
    }
    if (clean.contains('kararsızlığın')) {
      if (locale == 'de') return 'Was dich aufhält, ist nicht deine Kraft, sondern deine Unentschlossenheit.';
      if (locale == 'es') return 'Lo que te detiene no es tu fuerza, sino tu indecisión.';
      if (locale == 'fr') return 'Ce qui t\'arrête n\'est pas ta force, mais ton indécision.';
      return 'What stops you is not your strength, but your indecision.';
    }
    
    return quoteText;
  }
}
