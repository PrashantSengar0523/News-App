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
    apiKey: 'AIzaSyBcGlmTbht4sBr4xTEExyYY1PdW7lBNvR4',
    appId: '1:894773852742:web:d6dc78db6dbd7d305ae847',
    messagingSenderId: '894773852742',
    projectId: 'news-app-4ab92',
    authDomain: 'news-app-4ab92.firebaseapp.com',
    storageBucket: 'news-app-4ab92.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDLwNflvpzLAe3BPpQGhzgpy2NPuXD5m9Q',
    appId: '1:894773852742:android:1911cba2fbfb36bd5ae847',
    messagingSenderId: '894773852742',
    projectId: 'news-app-4ab92',
    storageBucket: 'news-app-4ab92.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCuIhIApuqMV57hpeJ5-LeckHq9PBxr8aU',
    appId: '1:894773852742:ios:e98379458df6ec705ae847',
    messagingSenderId: '894773852742',
    projectId: 'news-app-4ab92',
    storageBucket: 'news-app-4ab92.appspot.com',
    iosBundleId: 'com.example.nexusNews',
  );

}