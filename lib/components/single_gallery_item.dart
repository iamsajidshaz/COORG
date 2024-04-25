import 'package:flutter/material.dart';

class GalleryItem extends StatelessWidget {
  final String image;
  const GalleryItem({
    super.key,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Image.asset(
        image,
        fit: BoxFit.cover,
        frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
          return child;
        },
        errorBuilder: (context, error, stackTrace) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
