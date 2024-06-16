import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:photo_view/photo_view.dart';

class ViewImage extends StatelessWidget {
  final String imageUrl;
  final String imageName;
  final String isNetImage;
  const ViewImage({
    super.key,
    required this.isNetImage,
    required this.imageUrl,
    required this.imageName,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          imageName,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.sp,
          ),
        ),
        centerTitle: true,
      ),
      body: isNetImage == "yes"
          ? PhotoView(
              imageProvider: NetworkImage(imageUrl),
            )
          : PhotoView(imageProvider: AssetImage(imageUrl)),
    );
  }
}
