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
    apiKey: 'AIzaSyBSdwoOFZaQ2Wyw2yo1ttFnJqF7yiixh3Q',
    appId: '1:35859720068:web:40ec7247fed9c0ac0fdfd1',
    messagingSenderId: '35859720068',
    projectId: 'just-medical-center-automation',
    authDomain: 'just-medical-center-automation.firebaseapp.com',
    storageBucket: 'just-medical-center-automation.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAEj8eFWNIptG7rPGeMjA6FGEzgaFnXD-Q',
    appId: '1:35859720068:android:bf835ddb35fbf9dc0fdfd1',
    messagingSenderId: '35859720068',
    projectId: 'just-medical-center-automation',
    storageBucket: 'just-medical-center-automation.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD81GposS3yVyfZeGquSQAvZA4XgSGXiAg',
    appId: '1:35859720068:ios:476be6409c3ee0780fdfd1',
    messagingSenderId: '35859720068',
    projectId: 'just-medical-center-automation',
    storageBucket: 'just-medical-center-automation.firebasestorage.app',
    iosBundleId: 'com.example.justMedicalCenterAutomation',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD81GposS3yVyfZeGquSQAvZA4XgSGXiAg',
    appId: '1:35859720068:ios:476be6409c3ee0780fdfd1',
    messagingSenderId: '35859720068',
    projectId: 'just-medical-center-automation',
    storageBucket: 'just-medical-center-automation.firebasestorage.app',
    iosBundleId: 'com.example.justMedicalCenterAutomation',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBSdwoOFZaQ2Wyw2yo1ttFnJqF7yiixh3Q',
    appId: '1:35859720068:web:b63238437bd689190fdfd1',
    messagingSenderId: '35859720068',
    projectId: 'just-medical-center-automation',
    authDomain: 'just-medical-center-automation.firebaseapp.com',
    storageBucket: 'just-medical-center-automation.firebasestorage.app',
  );
}
