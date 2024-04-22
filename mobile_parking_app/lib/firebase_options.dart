// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
    apiKey: 'AIzaSyDHp0abj_2cyBddlnygB_mbIAEYWom3T0U',
    appId: '1:330981707235:web:0795a6eafe4e85968be4d6',
    messagingSenderId: '330981707235',
    projectId: 'garage-app-44057',
    authDomain: 'garage-app-44057.firebaseapp.com',
    storageBucket: 'garage-app-44057.appspot.com',
    measurementId: 'G-6ZD6188TB5',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD9FSNsTTDYmXopXN7Uhi484cSMK-MV0M4',
    appId: '1:330981707235:android:3664ff72d0a48a0e8be4d6',
    messagingSenderId: '330981707235',
    projectId: 'garage-app-44057',
    storageBucket: 'garage-app-44057.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCNz2UUHl2sWxfS5y5VUbZq1C9l1Bqg_n0',
    appId: '1:330981707235:ios:e0e4d19e3fb3eac18be4d6',
    messagingSenderId: '330981707235',
    projectId: 'garage-app-44057',
    storageBucket: 'garage-app-44057.appspot.com',
    androidClientId: '330981707235-cnar0hcuuaedudkgdlemtkh2dmfm3dns.apps.googleusercontent.com',
    iosClientId: '330981707235-htk30v2olgg3gietlm12p2bd3rlss76n.apps.googleusercontent.com',
    iosBundleId: 'com.example.mobileParkingApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCNz2UUHl2sWxfS5y5VUbZq1C9l1Bqg_n0',
    appId: '1:330981707235:ios:e0e4d19e3fb3eac18be4d6',
    messagingSenderId: '330981707235',
    projectId: 'garage-app-44057',
    storageBucket: 'garage-app-44057.appspot.com',
    androidClientId: '330981707235-cnar0hcuuaedudkgdlemtkh2dmfm3dns.apps.googleusercontent.com',
    iosClientId: '330981707235-htk30v2olgg3gietlm12p2bd3rlss76n.apps.googleusercontent.com',
    iosBundleId: 'com.example.mobileParkingApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDHp0abj_2cyBddlnygB_mbIAEYWom3T0U',
    appId: '1:330981707235:web:c59586047560f2b88be4d6',
    messagingSenderId: '330981707235',
    projectId: 'garage-app-44057',
    authDomain: 'garage-app-44057.firebaseapp.com',
    storageBucket: 'garage-app-44057.appspot.com',
    measurementId: 'G-MHXSYHB9YP',
  );

}