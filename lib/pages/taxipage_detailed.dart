import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TaxiPageDetailed extends StatelessWidget {
  final String image;
  final String owner;
  final String car;
  final String ratenonac;
  final String rateac;
  const TaxiPageDetailed({
    super.key,
    required this.image,
    required this.owner,
    required this.car,
    required this.ratenonac,
    required this.rateac,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          owner,
          style: TextStyle(
            fontSize: 16.sp,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Container(
            height: 250.h,
            decoration: BoxDecoration(
              color: Colors.amber,
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      car,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.sp,
                      ),
                    ),
                    Text(
                      "Rs.$ratenonac/KM",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.sp,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30.h,
                ),
                Text(
                  "Perfect journey partnet with 7 seater vehicle equipped with stereo system, luxury interiors and air conditioner included",
                  style: TextStyle(
                    fontSize: 12.sp,
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                Text(
                  "Overview",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.sp,
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(
                      Icons.car_crash,
                      size: 40.sp,
                    ),
                    Icon(
                      Icons.car_rental,
                      size: 40.sp,
                    ),
                    Icon(
                      Icons.car_rental_outlined,
                      size: 40.sp,
                    ),
                  ],
                ),
                SizedBox(
                  height: 50.h,
                ),
                Container(
                  width: 360.w,
                  height: 40.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blue,
                  ),
                  child: Center(child: Text("Book Now")),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
