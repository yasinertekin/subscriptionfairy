import 'package:flutter/material.dart';
// ignore: implementation_imports
import 'package:gen/src/index.dart';

/// CustomCatLoading is a [StatelessWidget]
final class CustomCatLoading extends StatelessWidget {
  /// Constructor of CustomCatLoading
  const CustomCatLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Assets.lottie.lottieLoadingCat.lottie(
        package: 'gen',
      ),
    );
  }
}
