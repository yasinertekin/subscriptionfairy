import 'package:flutter/material.dart';
import 'package:gen/src/index.dart';

/// [LottieSearch] is a widget that displays a lottie search.
final class LottieSearch extends StatelessWidget {
  /// Default constructor
  const LottieSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Assets.lottie.lottieSearch.lottie(
      package: 'gen',
    );
  }
}
