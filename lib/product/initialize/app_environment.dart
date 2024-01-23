import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:subscriptionfairy/product/environment/android/android_env.dart';
import 'package:subscriptionfairy/product/environment/app_configuration.dart';
import 'package:subscriptionfairy/product/environment/ios/ios_env.dart';

/// Application environment manager class
@immutable
final class AppEnvironment {
  /// Setup application environment
  AppEnvironment.setup({required AppConfiguration config}) {
    _config = config;
  }

  /// General application environment setup
  AppEnvironment.general() {
    _config = _getPlatformEnvironment();
  }

  static late final AppConfiguration _config;

  static AppConfiguration _getPlatformEnvironment() {
    if (Platform.isAndroid) {
      return AndroidEnv();
    } else if (Platform.isIOS) {
      return IosEnv();
    } else {
      throw Exception('Unsupported platform');
    }
  }

  /// Firebase options
  static FirebaseOptions get firebaseOptions {
    return FirebaseOptions(
      apiKey: _config.apiKey,
      appId: _config.appId,
      messagingSenderId: _config.messagingSenderId,
      projectId: _config.projectId,
      storageBucket: _config.storageBucket,
      iosBundleId: _config.iosBundleId,
    );
  }
}
