import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeStaysPage extends StatelessWidget {
  const HomeStaysPage({super.key});

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
                CupertinoIcons.house_alt_fill,
                size: 24.sp,
              ),

              // text
              Text(
                "H O M E   S T A Y S",
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
                  color: Colors.black,
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
                    color: Color.fromARGB(255, 19, 19, 18),
                    size: 24.sp,
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Text(
                    'Homestays in Coorg',
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
        SizedBox(
          height: 8.h,
        ),
      ],
    );
  }
}
