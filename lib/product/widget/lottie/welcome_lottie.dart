import 'package:flutter/material.dart';
// ignore: implementation_imports
import 'package:gen/src/index.dart';

/// WelcomeLottie is a [StatelessWidget]
final class WelcomeLottie extends StatelessWidget {
  /// Constructor of WelcomeLottie
  const WelcomeLottie({super.key});

  @override
  Widget build(BuildContext context) {
    return Assets.lottie.lottieWelcome.lottie(
      package: 'gen',
    );
  }
}
