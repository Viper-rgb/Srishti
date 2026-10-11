// File generated from android/app/google-services.json
// Run `flutterfire configure` to regenerate this file if you add more platforms.

import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      // Web is not configured — add your Firebase web config here if needed.
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for Web. '
        'You can reconfigure this file by running `flutterfire configure`.',
      );
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for iOS. '
          'You can reconfigure this file by running `flutterfire configure`.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  // Values taken from android/app/google-services.json
  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD2yxOC6naTQYUBA8JMamTUZOG3qlypvLs',
    appId: '1:76114510846:android:a91d2e875efd60ffca36af',
    messagingSenderId: '76114510846',
    projectId: 'fir-345d1',
    storageBucket: 'fir-345d1.firebasestorage.app',
  );
}
