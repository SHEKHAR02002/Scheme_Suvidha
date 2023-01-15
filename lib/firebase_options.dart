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
    apiKey: 'AIzaSyDkWBOG_lsxG_2yLTZGqylayBXPt6BSeIs',
    appId: '1:815781894657:web:849111787fa05249bdfe00',
    messagingSenderId: '815781894657',
    projectId: 'adip-d2113',
    authDomain: 'adip-d2113.firebaseapp.com',
    storageBucket: 'adip-d2113.appspot.com',
    measurementId: 'G-9JWJVEE8MK',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAVHtNKVhLrEEejE-pKgVilevAsjMwyZ6s',
    appId: '1:815781894657:android:fa1a43a15604d523bdfe00',
    messagingSenderId: '815781894657',
    projectId: 'adip-d2113',
    storageBucket: 'adip-d2113.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAywOdDar8p7UfL8ItNjTSUXYNEPjyQCvs',
    appId: '1:815781894657:ios:fca2ffb9fe410edfbdfe00',
    messagingSenderId: '815781894657',
    projectId: 'adip-d2113',
    storageBucket: 'adip-d2113.appspot.com',
    androidClientId: '815781894657-0ukatvgb32qrbslpbgfq3vsi1rk2f3e2.apps.googleusercontent.com',
    iosClientId: '815781894657-0dn4ptjbbg26hbpn4j5ibcl99u9l19cd.apps.googleusercontent.com',
    iosBundleId: 'com.example.scheme',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAywOdDar8p7UfL8ItNjTSUXYNEPjyQCvs',
    appId: '1:815781894657:ios:fca2ffb9fe410edfbdfe00',
    messagingSenderId: '815781894657',
    projectId: 'adip-d2113',
    storageBucket: 'adip-d2113.appspot.com',
    androidClientId: '815781894657-0ukatvgb32qrbslpbgfq3vsi1rk2f3e2.apps.googleusercontent.com',
    iosClientId: '815781894657-0dn4ptjbbg26hbpn4j5ibcl99u9l19cd.apps.googleusercontent.com',
    iosBundleId: 'com.example.scheme',
  );
}