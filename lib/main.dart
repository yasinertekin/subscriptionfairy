import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:subscriptionfairy/product/core/theme/theme.dart';
import 'package:subscriptionfairy/product/core/theme/theme_state.dart';
import 'package:subscriptionfairy/product/initialize/app_initialize.dart';
import 'package:subscriptionfairy/product/initialize/localization/project_localization.dart';
import 'package:subscriptionfairy/product/initialize/navigation/navigation_service.dart';
import 'package:subscriptionfairy/product/initialize/navigation/routes.dart';
import 'package:subscriptionfairy/product/initialize/state/state_initialize.dart';
import 'package:subscriptionfairy/product/utility/constants/string_constants/string_constants.dart';

Future<void> main() async {
  await AppInitialize.initialize();
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
          debugShowCheckedModeBanner: false,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          title: StringConstants.appName,
          theme: state.themeData,
          routes: Routes.getRouteTable(),
          initialRoute: Routes.initialRoute,
          navigatorKey: NavigationService.instance.navigatorKey,
        );
      },
    );
  }
}
