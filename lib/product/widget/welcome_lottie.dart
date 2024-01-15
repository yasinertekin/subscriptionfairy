import 'package:flutter/material.dart';
import 'package:gen/src/index.dart';

final class WelcomeLottie extends StatelessWidget {
  const WelcomeLottie({super.key});

  @override
  Widget build(BuildContext context) {
    return Assets.lottie.lottieWelcome.lottie(
      package: 'gen',
    );
  }
}
