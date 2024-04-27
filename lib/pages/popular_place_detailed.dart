import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:readmore/readmore.dart';

class PopularPlaceDetailedPage extends StatelessWidget {
  final String place;
  final String desc;
  final String imageUrl;
  final String lat;
  final String lang;
  const PopularPlaceDetailedPage({
    super.key,
    required this.place,
    required this.desc,
    required this.imageUrl,
    required this.lat,
    required this.lang,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        title: Text(
          place,
          style: TextStyle(fontSize: 22.sp),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          // show image
          Container(
            height: 690.w / 2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              image: DecorationImage(
                image: AssetImage(imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // details
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Text(
              "Descripion",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12.sp,
              ),
              //  style: Styles.headLineStyle3
              //       .copyWith(color: Colors.black87),
            ),
          ),
          // desc
          Padding(
            padding: const EdgeInsets.only(
              left: 18.0,
              bottom: 10,
            ),
            child: Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width - 40.w,
                  child: ReadMoreText(
                    desc,
                    style: TextStyle(fontSize: 12.sp),
                    trimLines: 3,
                    colorClickableText: Colors.pink,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: 'show more...',
                    trimExpandedText: 'show less',
                    moreStyle: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                    lessStyle: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                )
              ],
            ),
          ),
          //
          // Elevation: 1,170 m
          Padding(
            padding: const EdgeInsets.only(left: 18.0, bottom: 5),
            child: Text(
              "Elevation: 1,170 m",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12.sp,
              ),
              //  style: Styles.headLineStyle3
              //       .copyWith(color: Colors.black87),
            ),
          ),
          //
          Padding(
            padding: const EdgeInsets.only(left: 18.0, bottom: 5),
            child: Text(
              "District: Kodagu",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12.sp,
              ),
              //  style: Styles.headLineStyle3
              //       .copyWith(color: Colors.black87),
            ),
          ),

          //
          Padding(
            padding: const EdgeInsets.only(left: 18.0, bottom: 5),
            child: Text(
              "PIN: 571 201",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12.sp,
              ),
              //  style: Styles.headLineStyle3
              //       .copyWith(color: Colors.black87),
            ),
          ),
          //
          Padding(
            padding: const EdgeInsets.only(left: 18.0, bottom: 5),
            child: Text(
              "Region: Malenadu",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12.sp,
              ),
              //  style: Styles.headLineStyle3
              //       .copyWith(color: Colors.black87),
            ),
          ),
          //
          Padding(
            padding: const EdgeInsets.only(left: 18.0, bottom: 5),
            child: Text(
              "Telephone code: 08272",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12.sp,
              ),
              //  style: Styles.headLineStyle3
              //       .copyWith(color: Colors.black87),
            ),
          ),
          SizedBox(
            height: 30.h,
          ),

          Padding(
            padding: const EdgeInsets.all(18.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                //   primary: Colors.green,
                backgroundColor: Colors.blue,
                textStyle: TextStyle(
                  fontSize: 24.sp,
                  color: Colors.white,
                ),
                minimumSize: Size.fromHeight(40.h),
                shape: const StadiumBorder(),
              ),
              onPressed: () {
                MapsLauncher.launchCoordinates(
                  double.parse(lat.toString()),
                  double.parse(lang.toString()),
                  place,
                );
              },
              child: Text(
                'Get Location',
                style: TextStyle(
                  fontSize: 18.sp,
                  color: Colors.white,
                ),
                // style: Styles.headLineStyle2
                //     .copyWith(color: Colors.white),
              ),
            ),
          ),
          Center(
            child: Text(
              'Made with ❤ by ShazTech',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
          //
          SizedBox(
            height: 14.h,
          ),
        ],
      ),
    );
  }
}
