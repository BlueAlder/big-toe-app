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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyCPztcmS_wYHJRdFpYGBi0Z0qHQxClMmwg',
    appId: '1:183267650933:web:97f0543045af6c67e0373c',
    messagingSenderId: '183267650933',
    projectId: 'big-toe-game',
    authDomain: 'big-toe-game.firebaseapp.com',
    databaseURL: 'https://big-toe-game.firebaseio.com',
    storageBucket: 'big-toe-game.appspot.com',
    measurementId: 'G-9JWHK79L9P',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyApm_vxIN0yDeV4CcAnS1GfpuoTVBCr3FA',
    appId: '1:183267650933:android:c1e0312a6978c4b1e0373c',
    messagingSenderId: '183267650933',
    projectId: 'big-toe-game',
    databaseURL: 'https://big-toe-game.firebaseio.com',
    storageBucket: 'big-toe-game.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAMi_-n91C45kMYaZQXwEli4zPmuGIFrdA',
    appId: '1:183267650933:ios:de9e44253bec6b12e0373c',
    messagingSenderId: '183267650933',
    projectId: 'big-toe-game',
    databaseURL: 'https://big-toe-game.firebaseio.com',
    storageBucket: 'big-toe-game.appspot.com',
    iosClientId: '183267650933-ug0qbjl9udhesue45uvci5dipbk5e2nk.apps.googleusercontent.com',
    iosBundleId: 'com.example.bigToeMobile',
  );
}
