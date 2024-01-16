import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

/// CustomCachedNetworkImage
final class CustomCachedNetworkImage extends StatelessWidget {
  /// Default constructor
  const CustomCachedNetworkImage({
    required this.imageUrl,
    required this.height,
    required this.width,
    super.key,
  });

  /// imageUrl
  final String imageUrl;

  /// height
  final double height;

  /// width
  final double width;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      placeholder: (context, url) => const CircularProgressIndicator(),
      errorWidget: (context, url, error) => const Icon(Icons.error),
      fit: BoxFit.cover,
      height: height,
      width: width,
    );
  }
}
