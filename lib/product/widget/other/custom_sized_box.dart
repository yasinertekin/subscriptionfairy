import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

/// CustomSizedBox
final class CustomSizedBox extends StatelessWidget {
  /// CustomSizedBox constructor
  const CustomSizedBox({
    super.key,
    this.height = 0.03,
  });

  /// height
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.sized.dynamicHeight(height),
    );
  }
}
