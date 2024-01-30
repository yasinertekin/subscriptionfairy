import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:subscriptionfairy/product/initialize/app_environment.dart';

@immutable

/// AppInitialize
final class AppInitialize {
  const AppInitialize._();

  /// Initialize
  static Future<void> initialize() async {
    WidgetsFlutterBinding.ensureInitialized();
    await EasyLocalization.ensureInitialized();
    await DeviceUtility.instance.initPackageInfo();

    AppEnvironment.general();
    await Firebase.initializeApp(
      options: AppEnvironment.firebaseOptions,
    );
  }
}
