import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

/// CustomCachedNetworkImage
final class CustomCachedNetworkImage extends StatelessWidget {
  /// Default constructor
  const CustomCachedNetworkImage({
    required this.imageUrl,
    required this.height,
    required this.width,
    this.fit = BoxFit.cover,
    super.key,
  });

  /// imageUrl
  final String imageUrl;

  /// height
  final double height;

  /// width
  final double width;

  /// fit
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      placeholder: (context, url) => const Center(
        child: CircularProgressIndicator.adaptive(),
      ),
      errorWidget: (context, url, error) => const Icon(Icons.error),
      fit: fit,
      height: height,
      width: width,
    );
  }
}
