// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyAA6fKPOAzRA13pjxCVEW_TFMDPsbqAj9k',
    appId: '1:947034826396:web:6b11f1da50566a4b18af59',
    messagingSenderId: '947034826396',
    projectId: 'machine-learning-c7a69',
    authDomain: 'machine-learning-c7a69.firebaseapp.com',
    storageBucket: 'machine-learning-c7a69.firebasestorage.app',
    measurementId: 'G-EM8FNW7RHT',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDwLS2bBY6Qx6neQhQg2ImoExRgWGv5JrY',
    appId: '1:947034826396:android:0a5385541b8f0e8018af59',
    messagingSenderId: '947034826396',
    projectId: 'machine-learning-c7a69',
    storageBucket: 'machine-learning-c7a69.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAthHhC36J88MjenlwmD4gkMDGK2jzdWYU',
    appId: '1:947034826396:ios:66d4a2e62464226218af59',
    messagingSenderId: '947034826396',
    projectId: 'machine-learning-c7a69',
    storageBucket: 'machine-learning-c7a69.firebasestorage.app',
    iosBundleId: 'com.example.skinDiseasesDetectionSystem',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAthHhC36J88MjenlwmD4gkMDGK2jzdWYU',
    appId: '1:947034826396:ios:66d4a2e62464226218af59',
    messagingSenderId: '947034826396',
    projectId: 'machine-learning-c7a69',
    storageBucket: 'machine-learning-c7a69.firebasestorage.app',
    iosBundleId: 'com.example.skinDiseasesDetectionSystem',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAA6fKPOAzRA13pjxCVEW_TFMDPsbqAj9k',
    appId: '1:947034826396:web:e5b1559955d7371b18af59',
    messagingSenderId: '947034826396',
    projectId: 'machine-learning-c7a69',
    authDomain: 'machine-learning-c7a69.firebaseapp.com',
    storageBucket: 'machine-learning-c7a69.firebasestorage.app',
    measurementId: 'G-E68D1RXRH1',
  );

}