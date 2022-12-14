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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDD8o4DeyiQCSWW9FPkCxCVtbxiEz-ZA-4',
    appId: '1:340836474169:android:8398a3b8a6faffdb3bdce8',
    messagingSenderId: '340836474169',
    projectId: 'todo-f88ac',
    databaseURL: 'https://todo-f88ac-default-rtdb.firebaseio.com',
    storageBucket: 'todo-f88ac.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBYA_H_OY0ajbA3O4zWiHMiO6U7583aN2o',
    appId: '1:340836474169:ios:9dae2ff8d5eaaa693bdce8',
    messagingSenderId: '340836474169',
    projectId: 'todo-f88ac',
    databaseURL: 'https://todo-f88ac-default-rtdb.firebaseio.com',
    storageBucket: 'todo-f88ac.appspot.com',
    iosClientId:
        '340836474169-uo0a6u0knpobsfgt4k0emq5onbo76ims.apps.googleusercontent.com',
    iosBundleId: 'com.example.todoApp',
  );
}
