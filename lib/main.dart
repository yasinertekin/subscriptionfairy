import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:subscriptionfairy/feature/date_picker/date_picker.dart';
import 'package:subscriptionfairy/firebase_options.dart';
import 'package:subscriptionfairy/product/initialize/state/state_initialize.dart';
import 'package:subscriptionfairy/product/initialize/theme/custom_light_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    const StateInitialize(
      child: _MyApp(),
    ),
  );
}

final class _MyApp extends StatelessWidget {
  const _MyApp();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: CustomLightTheme().themeData,
      home: const DatePicker(),
    );
  }
}
