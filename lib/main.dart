import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';
import 'package:subscriptionfairy/product/core/theme/theme.dart';
import 'package:subscriptionfairy/product/core/theme/theme_state.dart';
import 'package:subscriptionfairy/product/initialize/app_environment.dart';
import 'package:subscriptionfairy/product/initialize/localization/project_localization.dart';
import 'package:subscriptionfairy/product/initialize/navigation/navigation_service.dart';
import 'package:subscriptionfairy/product/initialize/navigation/routes.dart';
import 'package:subscriptionfairy/product/initialize/state/state_initialize.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  print('widget flutter binding ensure initialized');
  await EasyLocalization.ensureInitialized();
  print('easy localization ensure initialized');
  await DeviceUtility.instance.initPackageInfo();
  print('device utility instance init package info');

  AppEnvironment.general();
  print('app environment general');
  await Firebase.initializeApp(
    options: AppEnvironment.firebaseOptions,
  );
  print('firebase initialize app');
  runApp(
    StateInitialize(
      child: ProductLocalization(
        child: const _MyApp(),
      ),
    ),
  );
}

final class _MyApp extends StatelessWidget {
  const _MyApp();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return MaterialApp(
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          title: 'Flutter Demo',
          theme: state.themeData,
          routes: Routes.getRouteTable(),
          initialRoute: Routes.initialRoute,
          navigatorKey: NavigationService.instance.navigatorKey,
        );
      },
    );
  }
}
