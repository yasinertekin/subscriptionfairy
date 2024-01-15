import 'package:flutter/material.dart';

/// [ProjectPadding] is a [EdgeInsets] for app theme
final class ProjectPadding extends EdgeInsets {
//// [ProjectPadding] is a [ProjectPadding] with 0.0 padding

  /// [ProjectPadding.allSmall] is a [ProjectPadding] with 8.0 padding
  const ProjectPadding.allSmall() : super.all(8);

  /// [ProjectPadding.allMedium] is a [ProjectPadding] with 16.0 padding
  const ProjectPadding.allMedium() : super.all(16);

  /// [ProjectPadding.allLarge] is a [ProjectPadding] with 24.0 padding
  const ProjectPadding.allLarge() : super.all(24);

  /// Symnetric
  /// [ProjectPadding.symmetricHorizontalSmall] is
  ///  a [ProjectPadding] with 8.0 horizontal padding
  const ProjectPadding.symmetricHorizontalSmall()
      : super.symmetric(
          horizontal: 8,
        );

  /// [ProjectPadding.symmetricHorizontalMedium] is
  ///  a [ProjectPadding] with 16.0 horizontal padding
  const ProjectPadding.symmetricHorizontalMedium()
      : super.symmetric(
          horizontal: 16,
        );

  /// [ProjectPadding.symmetricHorizontalLarge] is a [ProjectPadding]
  ///  with 24.0 horizontal padding
  const ProjectPadding.symmetricHorizontalLarge()
      : super.symmetric(
          horizontal: 24,
        );

  /// Only left, right, top, bottom
  /// [ProjectPadding.onlyLeftSmall] is a [ProjectPadding] with 8.0 left padding
  const ProjectPadding.onlyLeftSmall() : super.only(left: 8);
}
