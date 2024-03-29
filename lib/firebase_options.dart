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
    apiKey: 'AIzaSyAfHhI4OfH8_huoGsYm7Y2JhuBFxg0bV7Q',
    appId: '1:715131919811:web:cfc0ba8804cf29d419b176',
    messagingSenderId: '715131919811',
    projectId: 'scheme-suvidha-admin',
    authDomain: 'scheme-suvidha-admin.firebaseapp.com',
    storageBucket: 'scheme-suvidha-admin.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBx2wVzppvOalchbvIiE2sR9sVKN_-ATFY',
    appId: '1:715131919811:android:d81d6326eba8dcc419b176',
    messagingSenderId: '715131919811',
    projectId: 'scheme-suvidha-admin',
    storageBucket: 'scheme-suvidha-admin.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCo5MHQ5fR2ToMb1xYnyHWOarrBvZQv1OA',
    appId: '1:715131919811:ios:df7a320ffba089db19b176',
    messagingSenderId: '715131919811',
    projectId: 'scheme-suvidha-admin',
    storageBucket: 'scheme-suvidha-admin.appspot.com',
    androidClientId: '715131919811-m09b613ebena6hu5dakc7g3bkp9t2ett.apps.googleusercontent.com',
    iosClientId: '715131919811-ncrjd8sl4fgnibvavrmua2j3ra04cvdd.apps.googleusercontent.com',
    iosBundleId: 'com.schemesuvidha.app',
  );
}
