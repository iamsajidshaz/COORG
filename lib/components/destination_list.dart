import 'package:coorg/pagesss/popular_place_detailed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DestinationsList extends StatelessWidget {
  final String text;
  final String image;
  final String desc;
  final String lat;
  final String lang;
  const DestinationsList({
    super.key,
    required this.text,
    required this.image,
    required this.desc,
    required this.lat,
    required this.lang,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PopularPlaceDetailedPage(
              place: text,
              desc: desc,
              imageUrl: image,
              lat: lat,
              lang: lang,
            ),
          ),
        );
      },
      child: Column(
        children: [
          Container(
            width: 150.w,
            height: 170.h,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          Text(text)
        ],
      ),
    );
  }
}
