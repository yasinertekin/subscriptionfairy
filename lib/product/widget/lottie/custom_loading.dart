import 'package:flutter/material.dart';
import 'package:gen/src/index.dart';

/// This is the view for the register feature.
final class CustomLoading extends StatelessWidget {
  /// This is the constructor for the register view.
  const CustomLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Assets.lottie.lottieLoading.lottie(
          package: 'gen',
        ),
      ),
    );
  }
}
