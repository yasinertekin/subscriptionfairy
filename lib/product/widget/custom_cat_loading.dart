import 'package:flutter/material.dart';
import 'package:gen/src/index.dart';

final class CustomCatLoading extends StatelessWidget {
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
