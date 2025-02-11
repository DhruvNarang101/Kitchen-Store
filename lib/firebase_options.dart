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
    apiKey: 'AIzaSyCb2YcALdhQ2yJ5Ze6DgtD22-8fo3_kKjI',
    appId: '1:1084723240011:web:fbaf91f48853cd723841ce',
    messagingSenderId: '1084723240011',
    projectId: 'easyshopping-35c03',
    authDomain: 'easyshopping-35c03.firebaseapp.com',
    storageBucket: 'easyshopping-35c03.appspot.com',
    measurementId: 'G-YD1SR1XJDM',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBbB74CjsFP9Voiq24utNWBt6ME8wug4XQ',
    appId: '1:1084723240011:android:2ae0089d033e0b733841ce',
    messagingSenderId: '1084723240011',
    projectId: 'easyshopping-35c03',
    storageBucket: 'easyshopping-35c03.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCxunLxjuAWRyvEOo4sRjhKtFWxnilNKDg',
    appId: '1:1084723240011:ios:35e0c5594c1c68073841ce',
    messagingSenderId: '1084723240011',
    projectId: 'easyshopping-35c03',
    storageBucket: 'easyshopping-35c03.appspot.com',
    iosBundleId: 'com.example.eComm',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCxunLxjuAWRyvEOo4sRjhKtFWxnilNKDg',
    appId: '1:1084723240011:ios:35e0c5594c1c68073841ce',
    messagingSenderId: '1084723240011',
    projectId: 'easyshopping-35c03',
    storageBucket: 'easyshopping-35c03.appspot.com',
    iosBundleId: 'com.example.eComm',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCb2YcALdhQ2yJ5Ze6DgtD22-8fo3_kKjI',
    appId: '1:1084723240011:web:84f22aa5067e228e3841ce',
    messagingSenderId: '1084723240011',
    projectId: 'easyshopping-35c03',
    authDomain: 'easyshopping-35c03.firebaseapp.com',
    storageBucket: 'easyshopping-35c03.appspot.com',
    measurementId: 'G-NBCT08F184',
  );
}
