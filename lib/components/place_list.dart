import 'package:coorg/pages/explore_place_detailed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PlacesList extends StatelessWidget {
  final String text;
  final String image;
  final String desc;
  final String lat;
  final String lang;
  const PlacesList({
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
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DetailedPlace(
                    place: text,
                    dest: "Coorg",
                    imageUrl: image,
                    imageOne: image,
                    imageTwo: image,
                    imageThree: image,
                    facOne: "Parking",
                    facTwo: "Food",
                    facThree: "Guides",
                    desc: desc,
                    lat: lat,
                    lang: lang,
                  )),
        );
      },
      child: Hero(
        tag: image,
        child: Column(
          children: [
            Container(
              width: 200.w,
              height: 200.h,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                ),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 5),
              width: 200.w,
              height: 40.h,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                ),
              ),
              child: Text(
                text,
                textAlign: TextAlign.start,
                style: const TextStyle(
                    color: Colors.black87, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
    //  Container(
    //   width: 200,
    //   decoration: BoxDecoration(
    //     image: DecorationImage(
    //       image: AssetImage(image),
    //       fit: BoxFit.cover,
    //     ),
    //     color: color,
    //     borderRadius: BorderRadius.circular(12),
    //   ),
    //   child: Center(child: Text(text)),
    // );
  }
}
