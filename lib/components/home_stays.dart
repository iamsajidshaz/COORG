import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../pagesss/home_stay_view.dart';

class HomeStaysList extends StatelessWidget {
  final String image;
  final String label;
  final String subTitle;
  final String homestayID;
  final String imageOne;
  final String imageTwo;
  final String imageThree;
  final String fac1;
  final String fac2;
  final String fac3;
  final String fac4;
  final String fac5;
  final String activityOne;
  final String activityTwo;
  final String activityThree;

  const HomeStaysList({
    super.key,
    required this.image,
    required this.label,
    required this.subTitle,
    required this.imageOne,
    required this.imageTwo,
    required this.imageThree,
    required this.fac1,
    required this.fac2,
    required this.fac3,
    required this.fac4,
    required this.fac5,
    required this.activityOne,
    required this.activityTwo,
    required this.activityThree,
    required this.homestayID,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (context) => HomeStayView(
              fac1: fac1,
              fac2: fac2,
              fac3: fac3,
              fac4: fac4,
              fac5: fac5,
              imageOne: imageOne,
              imageTwo: imageTwo,
              imageThree: imageThree,
              image: image,
              label: label,
              subTitle: subTitle,
              activityOne: activityOne,
              activityTwo: activityTwo,
              activityThree: activityThree,
              id: homestayID,
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
                border: Border.all(color: Colors.grey),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                color: Colors.grey,
                image: DecorationImage(
                  image: NetworkImage(
                    image,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              width: 300.w,
              height: 50.h,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                //  color: Color.fromARGB(179, 216, 211, 211),
                borderRadius: const BorderRadius.only(
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
