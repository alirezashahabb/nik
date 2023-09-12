import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CachedImageService extends StatelessWidget {
  final String imageurl;
  BorderRadius? borderRadius;
  CachedImageService({
    super.key,
    required this.imageurl,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius,
      child: CachedNetworkImage(
        imageUrl: imageurl,
        fit: BoxFit.cover,
      ),
    );
  }
}
