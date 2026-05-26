import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MyChachedNetworkImage extends StatelessWidget {
  const MyChachedNetworkImage({
    super.key,
    required this.url,
  });

  final String url;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      fit: BoxFit.fill,
      errorWidget: (context, url, error) => const Center(
        child: Text(
          'Can\'t load image! check your internet connection.',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
