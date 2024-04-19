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
    apiKey: 'AIzaSyAEyM077CK8dbjgSEZSwf2IoIuKkhSnS-c',
    appId: '1:606223871677:web:7c6d8feba6b14f770791d4',
    messagingSenderId: '606223871677',
    projectId: 'mobile-pj-852a7',
    authDomain: 'mobile-pj-852a7.firebaseapp.com',
    storageBucket: 'mobile-pj-852a7.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDCs3J4n3yCaoWeay6vjgU4cSWviu-aBgA',
    appId: '1:606223871677:android:4c761030d2db68650791d4',
    messagingSenderId: '606223871677',
    projectId: 'mobile-pj-852a7',
    storageBucket: 'mobile-pj-852a7.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC9tkq9JVMco94EImZyJrQjDZTULr5gnJY',
    appId: '1:606223871677:ios:0d05205a0ea4f6ff0791d4',
    messagingSenderId: '606223871677',
    projectId: 'mobile-pj-852a7',
    storageBucket: 'mobile-pj-852a7.appspot.com',
    iosBundleId: 'com.example.shareProject',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAEyM077CK8dbjgSEZSwf2IoIuKkhSnS-c',
    appId: '1:606223871677:web:7c6d8feba6b14f770791d4',
    messagingSenderId: '606223871677',
    projectId: 'mobile-pj-852a7',
    authDomain: 'mobile-pj-852a7.firebaseapp.com',
    storageBucket: 'mobile-pj-852a7.appspot.com',
  );
}