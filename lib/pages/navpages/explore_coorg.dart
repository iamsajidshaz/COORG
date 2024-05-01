import 'package:coorg/components/home_stays.dart';
import 'package:coorg/utils/sample_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExploreCoorgPage extends StatelessWidget {
  ExploreCoorgPage({super.key});

  List<HomeStays> homestays = allHomeStays;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 25.0, top: 25, right: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // icon
              Icon(
                CupertinoIcons.location_circle,
                size: 24.sp,
              ),

              // text
              Text(
                "E X P L O R E   C O O R G",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12.sp),
              ),

              // icon
              IconButton(
                onPressed: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => const SettingsPage()));
                },
                icon: Icon(
                  CupertinoIcons.heart_fill,
                  color: Colors.transparent,
                  size: 24.sp,
                ),
              ),
            ],
          ),
        ),
        // gap
        SizedBox(
          height: 20.h,
        ),
        //
        Container(
          margin: const EdgeInsets.all(10),
          child: Text(
            textAlign: TextAlign.center,
            'Find the best place to stay',
            style: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.bold),
          ),
        ),
        // search bar
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: GestureDetector(
            //on tap
            onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => const SearchPlaces()),
              // );
            },
            //
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color(0xfff4f6fd),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              margin: const EdgeInsets.only(left: 12, right: 12, top: 10),
              child: Row(
                //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.search,
                    color: const Color.fromARGB(255, 19, 19, 18),
                    size: 24.sp,
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Text(
                    'Homestays, Hotels, Resorts in Coorg',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        //
        SizedBox(
          height: 8.h,
        ),
        //

        // 1. home stays / resorts

        // header
        Padding(
          padding: const EdgeInsets.only(left: 25.0, top: 25, right: 25),
          child: Text(
            'Home Stays',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12.sp),
          ),
        ),

        // list
        Container(
          margin: const EdgeInsets.only(left: 25, top: 12),
          height: 210.h,
          child: Padding(
            padding: const EdgeInsets.only(right: 12),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: allHomeStays.length,
              itemBuilder: (context, index) {
                final homestay = homestays[index];
                return HomeStaysList(
                  image: homestay.urlImage,
                );
              },
            ),
          ),
        ),

        // 2. Rooms
        // header
        Padding(
          padding: const EdgeInsets.only(left: 25.0, top: 25, right: 25),
          child: Text(
            'Rooms and Lodges',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12.sp),
          ),
        ),

        // list
        Container(
          margin: const EdgeInsets.only(left: 25, top: 12),
          height: 150.h,
          child: Padding(
            padding: const EdgeInsets.only(right: 12),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 8.0, right: 12),
                  child: Container(
                    width: 200.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.sp),
                      color: Colors.green,
                    ),
                  ),
                );
              },
            ),
          ),
        ),

        // 3. Food Spots
        // header
        Padding(
          padding: const EdgeInsets.only(left: 25.0, top: 25, right: 25),
          child: Text(
            'Food Spots',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12.sp),
          ),
        ),

        // list
        Container(
          margin: const EdgeInsets.only(left: 25, top: 12),
          height: 200.h,
          child: Padding(
            padding: const EdgeInsets.only(right: 12),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 8.0, right: 12),
                  child: Container(
                    width: 200.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.sp),
                      color: Colors.orangeAccent,
                    ),
                  ),
                );
              },
            ),
          ),
        ),

        // 4. Special in Coorg
        // header
        Padding(
          padding: const EdgeInsets.only(left: 25.0, top: 25, right: 25),
          child: Text(
            'More in Coorg',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12.sp),
          ),
        ),

        // list
        Container(
          margin: const EdgeInsets.only(left: 25, top: 12),
          height: 180.h,
          child: Padding(
            padding: const EdgeInsets.only(right: 12),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 8.0, right: 12),
                  child: Container(
                    width: 250.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.sp),
                      color: Colors.blueGrey,
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
