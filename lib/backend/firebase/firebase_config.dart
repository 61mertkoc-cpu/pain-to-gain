import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDzxBqPtJRMchh84DxG5UeuyXuWhUJMCNc",
            authDomain: "pain-to-gain-new.firebaseapp.com",
            projectId: "pain-to-gain-new",
            storageBucket: "pain-to-gain-new.firebasestorage.app",
            messagingSenderId: "262025946620",
            appId: "1:262025946620:web:bdba543f6a77495ffe3e79"));
  } else {
    await Firebase.initializeApp();
  }
}
