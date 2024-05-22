import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../pages/home_stay_view.dart';

class HomeStaysList extends StatelessWidget {
  final String image;
  final String label;
  final String subTitle;
  final String imageOne;
  final String imageTwo;
  final String imageThree;
  final List<String> fac;

  const HomeStaysList({
    super.key,
    required this.image,
    required this.label,
    required this.subTitle,
    required this.imageOne,
    required this.imageTwo,
    required this.imageThree,
    required this.fac,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (context) => HomeStayView(
              facils: fac,
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0, right: 12),
        child: Column(
          children: [
            Container(
              width: 300.w,
              height: 150.h,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                // color: Colors.blue,
                image: DecorationImage(
                  image: AssetImage(
                    image,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              width: 300.w,
              height: 50.h,
              decoration: const BoxDecoration(
                color: Colors.white70,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.home,
                          size: 12.sp,
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Text(
                          label,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14.sp,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.place,
                          size: 12.sp,
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Text(
                          subTitle,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14.sp,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
