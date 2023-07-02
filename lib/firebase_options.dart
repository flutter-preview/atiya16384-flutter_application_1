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
    apiKey: 'AIzaSyCRJGTPnq7vxL_NQxo5tfMGwiRATwOlAgA',
    appId: '1:357879728883:web:b0a7107819e86dccccc586',
    messagingSenderId: '357879728883',
    projectId: 'menopause-app',
    authDomain: 'menopause-app.firebaseapp.com',
    storageBucket: 'menopause-app.appspot.com',
    measurementId: 'G-P75REGLD2N',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBil1eJHYaE7gOdWz7kB6CINpb4yzi6UaM',
    appId: '1:357879728883:android:bb3e77f1ee1d6fb7ccc586',
    messagingSenderId: '357879728883',
    projectId: 'menopause-app',
    storageBucket: 'menopause-app.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBtIv435liXieYuWo_kZJBib3FN7nknCIo',
    appId: '1:357879728883:ios:3149fbb001058535ccc586',
    messagingSenderId: '357879728883',
    projectId: 'menopause-app',
    storageBucket: 'menopause-app.appspot.com',
    iosClientId: '357879728883-voov7tjlha7s1egau87mo87egs2lt2i2.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterApplication1',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBtIv435liXieYuWo_kZJBib3FN7nknCIo',
    appId: '1:357879728883:ios:3149fbb001058535ccc586',
    messagingSenderId: '357879728883',
    projectId: 'menopause-app',
    storageBucket: 'menopause-app.appspot.com',
    iosClientId: '357879728883-voov7tjlha7s1egau87mo87egs2lt2i2.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterApplication1',
  );
}