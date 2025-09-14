import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CachedNetworkImageCustom extends StatelessWidget {
  final String imagePath;
  const CachedNetworkImageCustom({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imagePath,
      placeholder: _loader,
      errorWidget: _error,
      fadeInDuration: const Duration(seconds: 3),
    );
  }

  Widget _loader(BuildContext context, String url) {
    return const Center(child: CircularProgressIndicator());
  }

  Widget _error(BuildContext context, String url, Object error) {
    return const Center(child: Icon(Icons.error));
  }
}
