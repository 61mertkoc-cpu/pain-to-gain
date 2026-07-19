import 'package:audioplayers/audioplayers.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/foundation.dart';

class AudioManager extends ChangeNotifier {
  AudioManager._privateConstructor() {
    _init();
  }
  static final AudioManager instance = AudioManager._privateConstructor();

  final AudioPlayer _player = AudioPlayer();
  double _volume = 0.5; // Default volume: 50%
  bool _isMuted = false;
  bool _isPlaying = false;
  String _currentTrack = 'audios/lofi_gym.mp3';

  // Available tracks mapped to display names
  final Map<String, String> availableTracks = {
    'audios/lofi_gym.mp3': 'PainToGain I',
    'audios/warrior_theme.mp3': 'PainToGain II',
    'audios/against_all_gods.mp3': 'PainToGain III',
    'audios/track4.mp3': 'PainToGain IV',
    'audios/track5.mp3': 'PainToGain V',
  };

  double get volume => _volume;
  bool get isMuted => _isMuted;
  bool get isPlaying => _isPlaying;
  String get currentTrack => _currentTrack;

  // Initialize preference and player loop configuration
  Future<void> _init() async {
    final prefs = await SharedPreferences.getInstance();
    _volume = prefs.getDouble('bg_music_volume') ?? 1.0;
    if (_volume < 1.0) _volume = 1.0; // Force upgrade old 0.5 saves to 1.0
    _isMuted = prefs.getBool('bg_music_muted') ?? false;
    _currentTrack = prefs.getString('bg_music_track') ?? 'audios/lofi_gym.mp3';

    // Configure loop mode
    await _player.setReleaseMode(ReleaseMode.loop);
    await _player.setVolume(_isMuted ? 0.0 : _volume);
  }

  // Start background loop music
  Future<void> startMusic() async {
    if (_isPlaying) return;
    try {
      // Use local asset for faster, reliable playback
      await _player.play(AssetSource(_currentTrack));
      _isPlaying = true;
      notifyListeners();
    } catch (e) {
      debugPrint("Error playing audio: $e");
    }
  }

  // Stop background music
  Future<void> stopMusic() async {
    if (!_isPlaying) return;
    await _player.stop();
    _isPlaying = false;
    notifyListeners();
  }

  // Set music volume (0.0 to 1.0)
  Future<void> setVolume(double value) async {
    _volume = value;
    if (!_isMuted) {
      await _player.setVolume(_volume);
    }
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble('bg_music_volume', _volume);
    notifyListeners();
  }

  // Toggle Mute/Unmute
  Future<void> toggleMute() async {
    _isMuted = !_isMuted;
    await _player.setVolume(_isMuted ? 0.0 : _volume);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('bg_music_muted', _isMuted);
    notifyListeners();
  }

  // Change currently playing track
  Future<void> changeTrack(String trackPath) async {
    if (!availableTracks.containsKey(trackPath)) return;
    
    _currentTrack = trackPath;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('bg_music_track', _currentTrack);
    
    if (_isPlaying) {
      await _player.stop();
      if (!_isMuted) {
        await _player.play(AssetSource(_currentTrack));
      }
    }
    notifyListeners();
  }
}
