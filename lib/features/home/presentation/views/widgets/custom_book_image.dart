
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomBookImage extends StatelessWidget {
  const CustomBookImage({super.key, this.borderRadies, required this.imageUrl});
  final BorderRadius? borderRadies;
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadies ?? BorderRadius.circular(17),
      child: AspectRatio(
        aspectRatio: 150/224,
        child:CachedNetworkImage(imageUrl: imageUrl,
        fit:BoxFit.fill,
        errorWidget: (context, url, error) => const Icon(Icons.error),)
      ),
    );
  }
}

