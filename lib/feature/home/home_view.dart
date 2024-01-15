import 'package:flutter/material.dart';

/// This is the view for the home feature.
final class HomeView extends StatelessWidget {
  /// This is the constructor for the home view.
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Home'),
      ),
    );
  }
}
