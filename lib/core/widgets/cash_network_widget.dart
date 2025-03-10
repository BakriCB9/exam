import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomCachImage extends StatelessWidget {
  final String imageurl;
  const CustomCachImage({required this.imageurl, super.key});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageurl,
      fit: BoxFit.cover,
      placeholder: (context, url) => Center(child: CircularProgressIndicator()),
      errorWidget: (context, _, __) => Center(child: Icon(Icons.error)),
    );
  }
}
