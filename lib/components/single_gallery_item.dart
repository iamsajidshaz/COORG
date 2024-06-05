import 'package:flutter/material.dart';

import '../pagesss/view_gallery_image.dart';

class GalleryItem extends StatelessWidget {
  final String image;
  final String imagePlace;
  const GalleryItem({
    super.key,
    required this.image,
    required this.imagePlace,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ViewImage(
                    imageUrl: image,
                    imageName: imagePlace,
                  )),
        );
      },
      child: Padding(
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
      ),
    );
  }
}
