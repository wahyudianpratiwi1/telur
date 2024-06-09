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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyDNQegFRhphk6lEqEAUGzlw0zBJQ3BL0qM',
    appId: '1:1026815491888:web:64c892a2e121f4181e92f5',
    messagingSenderId: '1026815491888',
    projectId: 'telur-1e0e8',
    authDomain: 'telur-1e0e8.firebaseapp.com',
    databaseURL: 'https://telur-1e0e8-default-rtdb.firebaseio.com',
    storageBucket: 'telur-1e0e8.appspot.com',
    measurementId: 'G-TTYDMM2F8R',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBow8lIZaHMjcI0Es6PiMKzgTUaS8wljYQ',
    appId: '1:1026815491888:android:c8ba0686f42a62d01e92f5',
    messagingSenderId: '1026815491888',
    projectId: 'telur-1e0e8',
    databaseURL: 'https://telur-1e0e8-default-rtdb.firebaseio.com',
    storageBucket: 'telur-1e0e8.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyArcmDjk-EfOfLAsrZ91vEoFzOXPISTGV4',
    appId: '1:1026815491888:ios:2a00ca9dab2817d01e92f5',
    messagingSenderId: '1026815491888',
    projectId: 'telur-1e0e8',
    databaseURL: 'https://telur-1e0e8-default-rtdb.firebaseio.com',
    storageBucket: 'telur-1e0e8.appspot.com',
    iosBundleId: 'com.example.monitoringApps',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyArcmDjk-EfOfLAsrZ91vEoFzOXPISTGV4',
    appId: '1:1026815491888:ios:2a00ca9dab2817d01e92f5',
    messagingSenderId: '1026815491888',
    projectId: 'telur-1e0e8',
    databaseURL: 'https://telur-1e0e8-default-rtdb.firebaseio.com',
    storageBucket: 'telur-1e0e8.appspot.com',
    iosBundleId: 'com.example.monitoringApps',
  );
}