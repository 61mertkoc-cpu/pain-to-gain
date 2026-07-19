import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import '/auth/firebase_auth/auth_util.dart';

class AdManager {
  static const int interstitialFrequency = 3; // Show ad every 3 actions
  static int _actionCount = 0;
  
  static InterstitialAd? _interstitialAd;
  static bool _isInterstitialAdLoading = false;

  // Test Ad Unit IDs
  static String get bannerAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-3940256099942544/6300978111'; // Android Test Banner
    } else if (Platform.isIOS) {
      return 'ca-app-pub-3940256099942544/2934735716'; // iOS Test Banner
    }
    throw UnsupportedError("Unsupported platform");
  }

  static String get interstitialAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-3940256099942544/1033173712'; // Android Test Interstitial
    } else if (Platform.isIOS) {
      return 'ca-app-pub-3940256099942544/4411468910'; // iOS Test Interstitial
    }
    throw UnsupportedError("Unsupported platform");
  }

  static void initialize() {
    // REKLAMLAR SS İÇİN TAMAMEN KAPATILDI
    return;
  }

  // --- Banner Ad Helpers ---
  static BannerAd createBannerAd({
    required Function(Ad) onAdLoaded,
    required Function(Ad, LoadAdError) onAdFailedToLoad,
  }) {
    return BannerAd(
      adUnitId: bannerAdUnitId,
      size: AdSize.banner,
      request: const AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: onAdLoaded,
        onAdFailedToLoad: onAdFailedToLoad,
      ),
    );
  }

  // --- Interstitial Ad Helpers ---
  static void _loadInterstitialAd() {
    if (kIsWeb) return;
    
    _isInterstitialAdLoading = true;
    InterstitialAd.load(
      adUnitId: interstitialAdUnitId,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          _interstitialAd = ad;
          _isInterstitialAdLoading = false;
        },
        onAdFailedToLoad: (error) {
          debugPrint('InterstitialAd failed to load: $error');
          _isInterstitialAdLoading = false;
          _interstitialAd = null;
        },
      ),
    );
  }

  // Use this method whenever a user performs a major navigation or action
  static void showInterstitialAdIfAppropriate() {
    if (kIsWeb) return;
    if (currentUserDocument?.isPremium == true) return;

    _actionCount++;
    
    // Only show ad if we reached the frequency limit and the ad is loaded
    if (_actionCount % interstitialFrequency == 0) {
      if (_interstitialAd != null) {
        _interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
          onAdDismissedFullScreenContent: (ad) {
            ad.dispose();
            _interstitialAd = null;
            // Preload the next ad
            _loadInterstitialAd();
          },
          onAdFailedToShowFullScreenContent: (ad, error) {
            ad.dispose();
            _interstitialAd = null;
            _loadInterstitialAd();
          },
        );
        _interstitialAd!.show();
        _interstitialAd = null; // Prevent showing the same ad twice
      } else if (!_isInterstitialAdLoading) {
        // If it wasn't loaded but we reached the limit, try loading for next time
        _loadInterstitialAd();
      }
    }
  }
}
